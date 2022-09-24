import 'package:app_cart_woocomerce/models/products_response.dart';

class Cart {
  final ProductModel product;
  final int numOfItems;

  Cart({
    required this.product,
    required this.numOfItems,
  });
}
