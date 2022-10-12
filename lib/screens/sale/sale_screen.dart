import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDesign(),
      body: Center(
        child: Text('SaleScreen'),
      ),
    );
  }
}
