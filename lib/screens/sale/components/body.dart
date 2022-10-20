import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WoocomerceProvider>(
        builder: (context, wocomerceProvider, child) {
          if (wocomerceProvider.saleProducts.isNotEmpty) {
            return _ProductList(
              products: wocomerceProvider.saleProducts,
              onNextPage: () => wocomerceProvider.getSaleProducts(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final List<ProductModel> products;
  final Function onNextPage;
  const _ProductList(
      {Key? key, required this.products, required this.onNextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductPoster(
                  product: products[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
