import 'package:json_annotation/json_annotation.dart';

import 'products.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
