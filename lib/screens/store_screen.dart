import 'package:app_cart_woocomerce/providers/woocomerce_providers.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    final providersAPI = Provider.of<WoocomerceProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ProductSlider(products: providersAPI.onDisplayProducts),
            CategorySlider(
              categories: providersAPI.productsCategories,
              onNextPage: () => providersAPI.getCategories(),
            ),
          ],
        ),
      ),
    );
  }
}
