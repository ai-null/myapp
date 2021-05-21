class ProductModel {
  final String id,
      title,
      location,
      merchant,
      isHalal,
      stock,
      photo,
      category,
      weight;
  final int price;

  ProductModel(
      {required this.id,
      required this.title,
      required this.location,
      required this.merchant,
      required this.category,
      required this.photo,
      required this.price,
      required this.isHalal,
      required this.stock,
      required this.weight});
}
