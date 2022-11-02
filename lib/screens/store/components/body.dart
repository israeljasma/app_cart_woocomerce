import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/search/search_delegate.dart';
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
          const _ProductFilters(),
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

class _ProductFilters extends StatelessWidget {
  const _ProductFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onTap: () => showSearch(
                  context: context, delegate: ProductSearchDelegate()),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.black12,
                filled: true,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ],
      ),
    );
  }
}
