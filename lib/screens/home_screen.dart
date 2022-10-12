import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = const [
    StoreScreen(),
    CategoryScreen(),
    SaleScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Tienda',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: 'Categorias',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: 'Ofertas',
            backgroundColor: AppTheme.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Mi Cuenta',
            backgroundColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
