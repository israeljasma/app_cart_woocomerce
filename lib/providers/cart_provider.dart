import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cart = [];

  CartProvider() {
    print('CartProvider inicializado');
  }

  addProduct(Cart product) {
    cart.add(product);
    notifyListeners();
  }

  deleteProduct(int id) {
    cart.removeAt(id);
    notifyListeners();
  }
}
