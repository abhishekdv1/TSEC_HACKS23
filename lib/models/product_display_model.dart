// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductDisplayModel {
  // final int id;
  final String? imagePath;
  final String productTitle;
  final String productDescription;
  final String exchangeProductDescription;
  final String tag;
  final int views;
  final num priceWhenBought;
  final int numYearsSinceBought;
  final int estimatedPrice;

  ProductDisplayModel({
    required this.imagePath,
    required this.productTitle,
    required this.productDescription,
    required this.exchangeProductDescription,
    required this.tag,
    required this.views,
    required this.priceWhenBought,
    required this.numYearsSinceBought,
    this.estimatedPrice = 0,
  });

  ProductDisplayModel copyWith({
    String? imagePath,
    String? productTitle,
    String? productDescription,
    String? exchangeProductDescription,
    String? tag,
    int? views,
    num? priceWhenBought,
    int? numYearsSinceBought,
    int? estimatedPrice,
  }) {
    return ProductDisplayModel(
      imagePath: imagePath ?? this.imagePath,
      productTitle: productTitle ?? this.productTitle,
      productDescription: productDescription ?? this.productDescription,
      exchangeProductDescription:
          exchangeProductDescription ?? this.exchangeProductDescription,
      tag: tag ?? this.tag,
      views: views ?? this.views,
      priceWhenBought: priceWhenBought ?? this.priceWhenBought,
      numYearsSinceBought: numYearsSinceBought ?? this.numYearsSinceBought,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagePath': imagePath,
      'productTitle': productTitle,
      'productDescription': productDescription,
      'exchangeProductDescription': exchangeProductDescription,
      'tag': tag,
      'views': views,
      'priceWhenBought': priceWhenBought,
      'numYearsSinceBought': numYearsSinceBought,
      'estimatedPrice': estimatedPrice,
    };
  }

  factory ProductDisplayModel.fromMap(Map<String, dynamic> map) {
    return ProductDisplayModel(
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      productTitle: map['productTitle'] as String,
      productDescription: map['productDescription'] as String,
      exchangeProductDescription: map['exchangeProductDescription'] as String,
      tag: map['tag'] as String,
      views: map['views'] as int,
      priceWhenBought: map['priceWhenBought'] as num,
      numYearsSinceBought: map['numYearsSinceBought'] as int,
      estimatedPrice: map['estimatedPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDisplayModel.fromJson(String source) =>
      ProductDisplayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDisplayModel(imagePath: $imagePath, productTitle: $productTitle, productDescription: $productDescription, exchangeProductDescription: $exchangeProductDescription, tag: $tag, views: $views, priceWhenBought: $priceWhenBought, numYearsSinceBought: $numYearsSinceBought, estimatedPrice: $estimatedPrice)';
  }

  @override
  bool operator ==(covariant ProductDisplayModel other) {
    if (identical(this, other)) return true;

    return other.imagePath == imagePath &&
        other.productTitle == productTitle &&
        other.productDescription == productDescription &&
        other.exchangeProductDescription == exchangeProductDescription &&
        other.tag == tag &&
        other.views == views &&
        other.priceWhenBought == priceWhenBought &&
        other.numYearsSinceBought == numYearsSinceBought &&
        other.estimatedPrice == estimatedPrice;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        productTitle.hashCode ^
        productDescription.hashCode ^
        exchangeProductDescription.hashCode ^
        tag.hashCode ^
        views.hashCode ^
        priceWhenBought.hashCode ^
        numYearsSinceBought.hashCode ^
        estimatedPrice.hashCode;
  }
}
