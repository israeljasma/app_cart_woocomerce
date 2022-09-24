import 'package:app_cart_woocomerce/providers/cart_provider.dart';
import 'package:app_cart_woocomerce/providers/woocomerce_providers.dart';
import 'package:app_cart_woocomerce/screens/cart/components/body.dart';
import 'package:app_cart_woocomerce/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: builtAppBar(context),
      body: const Body(),
      bottomNavigationBar: const ChekOurCard(),
    );
  }

  AppBar builtAppBar(BuildContext context) {
    final providersAPI = Provider.of<CartProvider>(context);
    var cart = context.watch<WoocomerceProvider>();
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Column(
        children: [
          const Text('Tu carrito', style: TextStyle(color: Colors.black)),
          Text('${providersAPI.cart.length} productos',
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}

class ChekOurCard extends StatelessWidget {
  const ChekOurCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataCart = Provider.of<CartProvider>(context);
    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.receipt_outlined),
                ),
                const Spacer(),
                const Text('Añadir código de cupón'),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios,
                    size: 12, color: Colors.black)
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: 'Total:\n', children: [
                    TextSpan(
                      text:
                          '\$${NumberFormat().thousandFormat(dataCart.price)}',
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ]),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: TextButton(
                    onPressed: () {
                      dataCart.deleteProduct(0);
                    },
                    child: const Text('Pagar'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
