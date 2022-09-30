import 'package:app_cart_woocomerce/providers/cart_provider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return AppBar(
      backgroundColor: Color.fromRGBO(128, 96, 76, 1),
      title: const Text('Jabon Organicos App'),
      actions: <Widget>[
        Badge(
          showBadge: cartProvider.cart.isEmpty ? false : true,
          badgeContent: Text(
            cartProvider.countProducts().toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          position: BadgePosition.topEnd(end: 3, top: 3),
          animationType: BadgeAnimationType.scale,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart',
                  arguments: 'movie-instance');
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
