import 'package:app_cart_woocomerce/providers/woocomerce_providers.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WoocomerceProvider(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Cart Woocomerce',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen(),
      },
      theme: AppTheme.lighTheme,
    );
  }
}
