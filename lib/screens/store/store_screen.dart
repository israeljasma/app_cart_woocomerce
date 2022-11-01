import 'package:app_cart_woocomerce/screens/store/components/body.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDesign(),
      body: Body(),
    );
  }
}
