import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/products/domain/usecases/products_usecase.dart';

import '../../domain/models/products_dto.dart';
import 'products_states.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsUsecase usecase;

  @factoryMethod
  ProductsViewModel(this.usecase) : super(ProductsLoadingState());

  static int limit = 30;
  final ScrollController scrollController = ScrollController();

  List<ProductsDto?>? allProducts = [];
  List<ProductsDto?>? searchedProducts = [];
  final TextEditingController textEditingController = TextEditingController();

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    final response = await usecase.invoke(limit);

    response.fold(
      (failure) => emit(ProductsErrorState(failure.message)),
      (products) {
        allProducts?.addAll(products ?? []);
        emit(ProductsSuccessState(products));
      },
    );
  }

  Future<void> paginationProducts() async {
    if (scrollController.position.atEdge) {
      if (scrollController.offset != 0) {
        limit += 10;

        final response = await usecase.invoke(limit);

        response.fold(
          (failure) => emit(ProductsErrorState(failure.message)),
          (products) {
            allProducts?.addAll(products ?? []);
            return emit(PaginationProductsState(products));
          },
        );
      }
    }
  }

  void addFilteredProductsToSearchedList(String searchedProduct) {
    searchedProducts = allProducts
        ?.where((product) =>
            product!.title!.toLowerCase().startsWith(searchedProduct))
        .toList();
  }
}
