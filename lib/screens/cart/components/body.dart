import 'package:app_cart_woocomerce/providers/cart_provider.dart';
import 'package:app_cart_woocomerce/screens/cart/components/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final dataCart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: dataCart.cart.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(dataCart.cart[index].product.id.toString()),
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: const [
                  Spacer(),
                  Icon(Icons.delete),
                  SizedBox(width: 10),
                ],
              ),
            ),
            onDismissed: (direction) {
              // demoCarts.removeAt(index);
              dataCart.deleteProduct(index);
            },
            child: CartItemCard(
              cart: dataCart.cart[index],
            ),
          ),
        ),
      ),
    );
  }
}
