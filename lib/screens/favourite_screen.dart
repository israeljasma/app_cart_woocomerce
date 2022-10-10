import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDesign(),
      body: Center(
        child: Text('FavouriteScreen'),
      ),
    );
  }
}
