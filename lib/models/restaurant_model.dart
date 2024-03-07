class Restaurant {
  final String name;
  final String address;
  final String deliveryTime;
  final String imgPath;
  final List<dynamic> categories;
  final int minOrderValue;
  final int rewievCount;
  final double rating;

  Restaurant(
      {required this.name,
      required this.address,
      required this.rating,
      required this.categories,
      required this.imgPath,
      required this.minOrderValue,
      required this.rewievCount,
      required this.deliveryTime});
}
