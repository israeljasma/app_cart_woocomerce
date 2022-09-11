import 'dart:convert';

import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WoocomerceProvider extends ChangeNotifier {
  final String _consumerKey = 'ck_79906660122a2edb046a16b42b58a0070ba8b2ce';
  final String _consumerSecret = 'cs_f74a6a3c286bd2ec473d22640368e3122a440423';
  final String _baseUrl = 'hostingincreible.cl';

  List<ProductModel> onDisplayProducts = [];
  List<Category> productsCategories = [];
  WoocomerceProvider() {
    print('WoocomerceProvider inicializado');
    getOnDisplayWoocomerce();
    getCategories();
  }

  Future<String> _getJsonData(String endPoint) async {
    var url = Uri.https(_baseUrl, endPoint, {
      'consumer_key': _consumerKey,
      'consumer_secret': _consumerSecret,
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayWoocomerce() async {
    print('getOnDisplayWoocomerce');
    final jsonData = await _getJsonData('/wp-json/wc/v3/products');
    List<ProductModel> products = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();

    onDisplayProducts = products;
    notifyListeners();
  }

  getCategories() async {
    final jsonData = await _getJsonData('/wp-json/wc/v3/products/categories');
    List<Category> categories = (json.decode(jsonData) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    productsCategories = categories;
    notifyListeners();
  }
}
