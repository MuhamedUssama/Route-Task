import 'package:route_task/features/products/domain/models/products_dto.dart';

abstract class ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsErrorState extends ProductsStates {
  String? errorMessage;
  ProductsErrorState(this.errorMessage);
}

class ProductsSuccessState extends ProductsStates {
  List<ProductsDto?>? products;
  ProductsSuccessState(this.products);
}

class PaginationProductsState extends ProductsStates {
  List<ProductsDto?>? products;
  PaginationProductsState(this.products);
}

class ProductsFilteringState extends ProductsStates {
  List<ProductsDto?>? products;
  ProductsFilteringState(this.products);
}
