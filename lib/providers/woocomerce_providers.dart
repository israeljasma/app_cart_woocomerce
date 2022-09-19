import 'dart:convert';

import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WoocomerceProvider extends ChangeNotifier {
  final String _consumerKey = 'ck_79906660122a2edb046a16b42b58a0070ba8b2ce';
  final String _consumerSecret = 'cs_f74a6a3c286bd2ec473d22640368e3122a440423';
  final String _baseUrl = 'hostingincreible.cl';

  List<ProductModel> onDisplayProducts = [];
  List<Category> productsCategories = [];
  int _categoriesPage = 0;
  WoocomerceProvider() {
    print('WoocomerceProvider inicializado');
    getOnDisplayWoocomerce();
    getCategories();
  }

  Future<String> _getJsonData(String endPoint, Map parameters2) async {
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };
    // if (pageNumber != null) {
    //   parameters.addAll({'page': pageNumber});
    //   print('pageNumber');
    // }

    // if (pageSize != null) {
    //   parameters.addAll({'per_page': pageSize});
    //   print('pageSize');
    // }

    // if (strSearch != '') {
    //   parameters.addAll({'search': strSearch});
    //   // print('strSearch');
    // }

    // if (categoryId != null) {
    //   parameters.addAll({'category': categoryId});
    //   print(parameters);
    //   print('categoryId');
    //   print(categoryId);
    // } else {
    //   print('pum feo');
    // }

    // if (sortBy != null) {
    //   parameters.addAll({'orderby': sortBy});
    //   // print('sortBy');
    // }

    // if (sortOrder != null) {
    //   parameters.addAll({'order': sortOrder});
    //   // print('sortOrder');
    // }

    var url = Uri.https(_baseUrl, endPoint, parameters);

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayWoocomerce(
      {int? pageNumber,
      int? pageSize,
      String? strSearch,
      String? categoryId,
      String? sortBy,
      String? sortOrder}) async {
    print('getOnDisplayWoocomerce');
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };
    if (pageNumber != null) {
      parameters.addAll({'page': pageNumber});
    }

    if (pageSize != null) {
      parameters.addAll({'per_page': pageSize});
    }

    if (strSearch != '') {
      parameters.addAll({'search': strSearch});
    }

    if (categoryId != null) {
      parameters.addAll({'category': categoryId});
    }

    if (sortBy != null) {
      parameters.addAll({'orderby': sortBy});
    }

    if (sortOrder != null) {
      parameters.addAll({'order': sortOrder});
    }
    final jsonData = await _getJsonData('/wp-json/wc/v3/products', parameters);
    List<ProductModel> products = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();

    onDisplayProducts = products;
    notifyListeners();
  }

  getCategories() async {
    _categoriesPage++;
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };
    final jsonData =
        await _getJsonData('/wp-json/wc/v3/products/categories', parameters);
    List<Category> categories = (json.decode(jsonData) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    productsCategories = categories;
    notifyListeners();
  }
}
