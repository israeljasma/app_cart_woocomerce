import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    if (isLogin) {
      return LoginScreen();
    }
    return const Scaffold(
      body: Center(
        child: Text('AccountScreen'),
      ),
    );
  }
}
