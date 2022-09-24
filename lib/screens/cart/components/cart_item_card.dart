import 'package:app_cart_woocomerce/models/cart.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/loading-image.png'),
                  image: NetworkImage(widget.cart.product.images.first.src),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cart.product.name,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '\$${widget.cart.product.price}',
                style: const TextStyle(color: Colors.orange),
                children: [
                  TextSpan(
                    text: ' x${widget.cart.numOfItems}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
