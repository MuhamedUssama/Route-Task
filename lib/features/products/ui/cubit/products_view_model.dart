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

  int limit = 30;
  bool isPagination = false;
  final ScrollController scrollController = ScrollController();

  List<ProductsDto?>? allProducts = [];
  List<ProductsDto?>? filteredProducts = [];
  final TextEditingController textEditingController = TextEditingController();

  Future<void> getProducts() async {
    if (!isPagination) {
      emit(ProductsLoadingState());
    }
    final response = await usecase.invoke(limit);

    response.fold(
      (failure) => emit(ProductsErrorState(failure.message)),
      (products) {
        allProducts = products;
        emit(ProductsSuccessState(products));
      },
    );
  }

  void onScroll() {
    if (scrollController.position.atEdge &&
        textEditingController.text.isEmpty) {
      if (scrollController.offset != 0) {
        isPagination = true;
        limit += 10;
        getProducts();
      }
    }
  }

  void addFilteredProductsToFilteredList(String searchedProduct) {
    filteredProducts = allProducts
        ?.where((product) =>
            product!.title!.toLowerCase().contains(searchedProduct))
        .toList();

    emit(ProductsFilteringState(filteredProducts));
  }
}
