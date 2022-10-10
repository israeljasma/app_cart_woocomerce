import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {}

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
};
