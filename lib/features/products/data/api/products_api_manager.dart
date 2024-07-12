import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/exceptions.dart';
import 'package:route_task/core/networking/end_points.dart';
import 'package:route_task/features/products/data/models/products_response.dart';

import '../../../../core/networking/api_consumer.dart';

@singleton
@injectable
class ProductsApiManager {
  ApiConsumer apiConsumer;

  @factoryMethod
  ProductsApiManager(this.apiConsumer);

  Future<Either<ServerException, ProductsResponse?>> getProducts(
      int? limit) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final json = await apiConsumer.get(EndPoints.products, queryParameters: {
        "limit": limit,
      });
      ProductsResponse productsResponse = ProductsResponse.fromJson(json);

      if (productsResponse.total != 0) {
        return Right(productsResponse);
      } else {
        return const Left(ServerException('No products found'));
      }
    } else {
      return const Left(
        ServerException('Please check your internet connection'),
      );
    }
  }
}
