import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> cart = [];
  int price = 0;

  CartProvider() {
    print('CartProvider inicializado');
  }

  countProducts() {
    if (cart.isEmpty) {
      return cart.length;
    } else {
      int count = 0;
      for (var product in cart) {
        count = count + product.numOfItems;
      }
      return count;
    }
  }

  addProduct(Cart product) {
    if (cart.isEmpty) {
      cart.add(product);
      priceAdd(int.parse(product.product.price) * product.numOfItems);
    } else {
      for (var item in cart) {
        if (product.product.id != item.product.id) {
          cart.add(product);
          priceAdd(int.parse(product.product.price) * product.numOfItems);
          break;
        } else {
          item.numOfItems = product.numOfItems + item.numOfItems;
          priceAdd(int.parse(product.product.price) * product.numOfItems);
          break;
        }
      }
    }
    notifyListeners();
  }

  deleteProduct(int id) {
    var actualPrice = int.parse(cart[id].product.price) * cart[id].numOfItems;
    cart.removeAt(id);
    priceLess(actualPrice);
    notifyListeners();
  }

  priceAdd(int productPrice) {
    price = price + productPrice;
  }

  priceLess(int productPrice) {
    price = price - productPrice;
  }
}
