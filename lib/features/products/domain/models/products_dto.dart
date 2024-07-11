import 'package:json_annotation/json_annotation.dart';

part 'products_dto.g.dart';

@JsonSerializable()
class ProductsDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsDto? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewsDto>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaDto? meta;
  List<String>? images;
  String? thumbnail;

  ProductsDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDtoToJson(this);
}

@JsonSerializable()
class DimensionsDto {
  double? width;
  double? height;
  double? depth;

  DimensionsDto({
    this.width,
    this.height,
    this.depth,
  });

  factory DimensionsDto.fromJson(Map<String, dynamic> json) =>
      _$DimensionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsDtoToJson(this);
}

@JsonSerializable()
class ReviewsDto {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ReviewsDto({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewsDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsDtoToJson(this);
}

@JsonSerializable()
class MetaDto {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  MetaDto({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}
