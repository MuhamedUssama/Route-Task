import 'package:dartz/dartz.dart';

import 'package:route_task/core/errors/exceptions.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';

abstract class ProductsRepository {
  Future<Either<ServerException, List<ProductsDto?>?>> getProducts(int? limit);
}
