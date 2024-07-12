import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/exceptions.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';
import 'package:route_task/features/products/domain/repository/products_repository.dart';

@injectable
class ProductsUsecase {
  ProductsRepository productsRepository;

  @factoryMethod
  ProductsUsecase(this.productsRepository);

  Future<Either<ServerException, List<ProductsDto?>?>> invoke(
      int? limit) async {
    final response = await productsRepository.getProducts(limit);

    return response.fold(
      (failure) => Left(ServerException(failure.message)),
      (products) => Right(products),
    );
  }
}
