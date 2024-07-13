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
  final ScrollController scrollController = ScrollController();

  List<ProductsDto?>? allProducts = [];
  List<ProductsDto?>? filteredProducts = [];
  final TextEditingController textEditingController = TextEditingController();

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    final response = await usecase.invoke(limit);

    response.fold(
      (failure) => emit(ProductsErrorState(failure.message)),
      (products) {
        allProducts = products;
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
            allProducts = products;
            return emit(PaginationProductsState(products));
          },
        );
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
