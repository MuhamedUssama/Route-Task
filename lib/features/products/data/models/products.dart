import 'package:json_annotation/json_annotation.dart';
import 'package:route_task/features/products/domain/models/products_dto.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
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
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Products({
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

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  ProductsDto toProductsDto() {
    return ProductsDto(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      dimensions: dimensions?.toDimensionsDto(),
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews?.map((review) => review.toReviewsDto()).toList(),
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      meta: meta?.toMetaDto(),
      images: images,
      thumbnail: thumbnail,
    );
  }
}

@JsonSerializable()
class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);

  DimensionsDto toDimensionsDto() {
    return DimensionsDto(
      depth: depth,
      height: height,
      width: width,
    );
  }
}

@JsonSerializable()
class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);

  ReviewsDto toReviewsDto() {
    return ReviewsDto(
      comment: comment,
      date: date,
      rating: rating,
      reviewerEmail: reviewerEmail,
      reviewerName: reviewerName,
    );
  }
}

@JsonSerializable()
class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  MetaDto toMetaDto() {
    return MetaDto(
      createdAt: createdAt,
      updatedAt: updatedAt,
      barcode: barcode,
      qrCode: qrCode,
    );
  }
}
