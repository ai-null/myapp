import 'package:myapp/model/ProductModel.dart';

class CartModel {
  final ProductModel product;
  final int quantity;

  CartModel({required this.product, required this.quantity});
}
