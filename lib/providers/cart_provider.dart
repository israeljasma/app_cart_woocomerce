import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cart = [];
  int price = 0;

  CartProvider() {
    print('CartProvider inicializado');
  }

  addProduct(Cart product) {
    cart.add(product);
    priceAdd(int.parse(product.product.price));
    notifyListeners();
  }

  deleteProduct(int id) {
    var actualPrice = cart[id].product.price;
    cart.removeAt(id);
    priceLess(int.parse(actualPrice));
    notifyListeners();
  }

  priceAdd(int productPrice) {
    price = price + productPrice;
  }

  priceLess(int productPrice) {
    price = price - productPrice;
  }
}
