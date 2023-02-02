class ProductDisplayModel {
  // final int id;
  final String imageName;
  final String productTitle;
  final String productDescription;
  final String exchangeProductDescription;
  final String tag;
  final int views;
  final num priceWhenBought;
  final int numYearsSinceBought;
  final int estimatedPrice;

  ProductDisplayModel({
    required this.imageName,
    required this.productTitle,
    required this.productDescription,
    required this.exchangeProductDescription,
    required this.tag,
    required this.views,
    required this.priceWhenBought,
    required this.numYearsSinceBought,
    this.estimatedPrice = 0,
  });
}
