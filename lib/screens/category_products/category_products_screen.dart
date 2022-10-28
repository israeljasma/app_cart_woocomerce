import 'package:app_cart_woocomerce/screens/category_products/components/body.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  static String routeName = "/category_products";
  final String categoryID;
  const CategoryProductsScreen({
    Key? key,
    required this.categoryID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDesign(),
      body: Body(
        categoryID: categoryID,
      ),
    );
  }
}
