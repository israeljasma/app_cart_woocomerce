import 'package:app_cart_woocomerce/screens/category/components/body.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDesign(),
      body: Body(),
    );
  }
}
