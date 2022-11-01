import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final woocomerceProvider = Provider.of<WoocomerceProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProductSlider(
            products: woocomerceProvider.latestProducts,
            // providersWoocomerceAPI: woocomerceProvider,
          ),
          // Categories(
          //   categories: woocomerceProvider.productsCategories,
          //   onNextPage: () => woocomerceProvider.getCategories(),
          // ),
        ],
      ),
    );
  }
}
