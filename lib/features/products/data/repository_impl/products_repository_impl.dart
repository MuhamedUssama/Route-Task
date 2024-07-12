import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/exceptions.dart';
import 'package:route_task/features/products/data/data_sources/products_data_source.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';
import 'package:route_task/features/products/domain/repository/products_repository.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  ProductsDataSource productsDataSource;

  @factoryMethod
  ProductsRepositoryImpl(this.productsDataSource);

  @override
  Future<Either<ServerException, List<ProductsDto?>?>> getProducts() async {
    final productsResponse = await productsDataSource.getProducts();

    return productsResponse.fold(
      (failure) => Left(ServerException(failure.message)),
      (response) => Right(response),
    );
  }
}
