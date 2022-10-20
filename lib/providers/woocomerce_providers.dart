import 'dart:convert';

import 'package:app_cart_woocomerce/models/models.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WoocomerceProvider extends ChangeNotifier {
  final String _consumerKey = 'ck_79906660122a2edb046a16b42b58a0070ba8b2ce';
  final String _consumerSecret = 'cs_f74a6a3c286bd2ec473d22640368e3122a440423';
  final String _baseUrl = 'creacion.agencia-web.com';

  List<ProductModel> onDisplayProducts = [];
  List<ProductModel> latestProducts = [];
  List<ProductModel> relatedProducts = [];
  List<ProductModel> saleProducts = [];
  List<Category> productsCategories = [];
  List<Category> categoriesList = [];
  List<ProductModel> categoryProductsList = [];

  int _productPage = 0;
  int _categoriesPage = 0;
  int _categoriesListPage = 0;
  int _categoryProductsListPage = 0;
  late int row = 10;
  late int col;
  late var matrixCategories;

  WoocomerceProvider() {
    print('WoocomerceProvider inicializado');
    getCategories();
    getLatestProducts();
    getMatrixCategories();
    getProducts();
    getCategoriesList();
    getSaleProducts();
  }

  Future<String> _getJsonData(String endPoint, parameters) async {
    var url = Uri.https(_baseUrl, endPoint, parameters);

    final response = await http.get(url);

    return response.body;
  }

  getProducts(
      {int? pageNumber,
      int? pageSize,
      String? strSearch,
      String? categoryId,
      String? sortBy,
      String? sortOrder}) async {
    _productPage++;
    print('getOnDisplayWoocomerce');
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };

    parameters.addAll({'page': '$_productPage'});

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

    onDisplayProducts = [...onDisplayProducts, ...products];

    notifyListeners();
  }

  getCategories() async {
    _categoriesPage++;
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };

    parameters.addAll({'page': '$_categoriesPage'});
    final jsonData =
        await _getJsonData('/wp-json/wc/v3/products/categories', parameters);
    List<Category> categories = (json.decode(jsonData) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    productsCategories = [...productsCategories, ...categories];

    notifyListeners();
  }

  getCategoriesList() async {
    _categoriesListPage++;
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };
    print('getCategoriesList');
    parameters.addAll({'page': '$_categoriesListPage'});
    final jsonData =
        await _getJsonData('/wp-json/wc/v3/products/categories', parameters);
    List<Category> categories = (json.decode(jsonData) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    categoriesList = [...categoriesList, ...categories];

    notifyListeners();
  }

  getLatestProducts() async {
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey,
    };

    final jsonData = await _getJsonData('/wp-json/wc/v3/products', parameters);
    List<ProductModel> products = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();
    latestProducts = products;
    notifyListeners();
  }

  geRelatedProducts(List<Category> categories, int productExclude) async {
    print(categories.first.id);
    categories.shuffle();
    print(categories.first.id);
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey,
    };

    // if (categoryId != null) {
    //   parameters.addAll({'category': categoryId});
    // }

    parameters.addAll({'category': '${categories.first.id}'});

    final jsonData = await _getJsonData('/wp-json/wc/v3/products', parameters);
    List<ProductModel> products = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();

    products.shuffle();
    products.removeRange(2, products.length);
    relatedProducts = products;
    print('largo prodcutos: ${products.length}');
    notifyListeners();
  }

  getSaleProducts() async {
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey,
    };

    parameters.addAll({'on_sale': 'true'});

    final jsonData = await _getJsonData('/wp-json/wc/v3/products', parameters);
    List<ProductModel> products = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();
    saleProducts = [...saleProducts, ...products];
    notifyListeners();
  }

  getMatrixCategories() async {
    print('getMatrixCategories');
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey,
    };

    parameters.addAll({'per_page': '100'});

    final jsonData =
        await _getJsonData('/wp-json/wc/v3/products/categories', parameters);

    List<Category> categories = (json.decode(jsonData) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    print('categorias ${categories.length}');
    col = categories.length;

    matrixCategories = List.generate(
        col, (i) => List.filled(row, i + 1, growable: false),
        growable: false);

    // matrixCategories[0].add(1);
    // matrixCategories[0].add(1);
    // matrixCategories[0].add(1);
    // matrixCategories[0].add(1);

    matrixCategories;

    print(matrixCategories[4][7]);
  }

  getCategoryProductsList(String idCategory) async {
    _categoryProductsListPage++;
    Map<String, dynamic> parameters = {
      'consumer_secret': _consumerSecret,
      'consumer_key': _consumerKey
    };
    parameters.addAll({'category': idCategory});
    parameters.addAll({'page': '$_categoryProductsListPage'});
    final jsonData = await _getJsonData('/wp-json/wc/v3/products', parameters);
    List<ProductModel> categories = (json.decode(jsonData) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();

    categoryProductsList = [...categoryProductsList, ...categories];

    notifyListeners();
  }

  resetCategoryProductsListParameters() async {
    categoryProductsList.clear();
    _categoryProductsListPage = 0;
  }
}
