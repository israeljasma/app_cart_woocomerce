import 'dart:convert';
import 'dart:io';

import 'package:app_cart_woocomerce/models/login_response.dart';
import 'package:app_cart_woocomerce/models/user_model.dart';
import 'package:app_cart_woocomerce/providers/config.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/products_response.dart';

class APIService {
  // Future<bool> createCustomer(CustomerModel model) async {
  //   var authToken = base64.encode(
  //     utf8.encode(Config.key + ':' + Config.secret),
  //   );
  //   bool ret = false;

  //   try {
  //     var response = await Dio().post(Config.url + Config.customersUrl,
  //         data: model.toJson(),
  //         options: Options(headers: {
  //           HttpHeaders.authorizationHeader: 'Basic $authToken',
  //           HttpHeaders.contentTypeHeader: 'application/json'
  //         }));

  //     if (response.statusCode == 201) {
  //       ret = true;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       ret = false;
  //     } else {
  //       ret = false;
  //     }
  //   }
  //   return ret;
  // }

  Future loginCustomer(String username, String password) async {
    late LoginResponse model;
    try {
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
          },
        ),
      );
      if (response.statusCode == 200) {
        model = LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.response?.data);
    }
    return model;
  }

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.https('hostingincreible.cl', '/wp-json/wc/v3/products', {
      'consumer_key': 'ck_79906660122a2edb046a16b42b58a0070ba8b2ce',
      'consumer_secret': 'cs_f74a6a3c286bd2ec473d22640368e3122a440423',
    });
    final response = await http.get(url);
    List<ProductModel> products = (json.decode(response.body) as List)
        .map((data) => ProductModel.fromJson(data))
        .toList();
    print(products);
    return products;
  }

  Future<List<UserModel>> getUsers() async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: Config.testUrl2)).get(Config.testUrl2);
      final List data = response.data["data"];
      // print(data.map((e) => UserModel.fromJson(e)).toList());
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
