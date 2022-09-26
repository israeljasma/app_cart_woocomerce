import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDesign({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('App Cart Woocomerce'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart', arguments: 'movie-instance');
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
