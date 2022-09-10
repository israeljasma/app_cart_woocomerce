import 'dart:convert';

import 'package:app_cart_woocomerce/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WoocomerceProvider extends ChangeNotifier {
  final String _consumerKey = 'ck_79906660122a2edb046a16b42b58a0070ba8b2ce';
  final String _consumerSecret = 'cs_f74a6a3c286bd2ec473d22640368e3122a440423';
  final String _baseUrl = 'hostingincreible.cl';

  List<ProductModel> onDisplayProducts = [];
  WoocomerceProvider() {
    print('WoocomerceProvider inicializado');
    getOnDisplayWoocomerce();
  }

  getOnDisplayWoocomerce() async {
    print('getOnDisplayWoocomerce');
    var url = Uri.https(_baseUrl, '/wp-json/wc/v3/products', {
      'consumer_key': _consumerKey,
      'consumer_secret': _consumerSecret,
    });

    final response = await http.get(url);
    List<ProductModel> products = (json.decode(response.body) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();
    print(products[0].images.first.src);

    onDisplayProducts = products;

    notifyListeners();
  }
}
