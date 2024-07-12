import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/products/domain/usecases/products_usecase.dart';

import 'products_states.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsUsecase usecase;

  int limit = 30;

  @factoryMethod
  ProductsViewModel(this.usecase) : super(ProductsLoadingState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    final response = await usecase.invoke(limit);

    response.fold(
      (failure) => emit(ProductsErrorState(failure.message)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }
}
