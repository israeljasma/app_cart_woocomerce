import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {}

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
};
