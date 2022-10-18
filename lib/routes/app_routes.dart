import 'package:app_cart_woocomerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:app_cart_woocomerce/screens/login_success/login_success_screen.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {}

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
};
