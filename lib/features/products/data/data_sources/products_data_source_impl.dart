import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/exceptions.dart';
import 'package:route_task/features/products/data/api/products_api_manager.dart';
import 'package:route_task/features/products/data/data_sources/products_data_source.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  ProductsApiManager apiManager;

  @factoryMethod
  ProductsDataSourceImpl(this.apiManager);

  @override
  Future<Either<ServerException, List<ProductsDto?>?>> getProducts() async {
    final productsResponse = await apiManager.getProducts();
    return productsResponse.fold(
      (failure) => Left(ServerException(failure.message)),
      (response) => Right(
        response?.products?.map((product) => product.toProductsDto()).toList(),
      ),
    );
  }
}
