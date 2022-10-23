import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:app_cart_woocomerce/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final woocomerceProvider = Provider.of<WoocomerceProvider>(context);
    return Container(
      width: 150,
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                product: product,
                relatedProduct: woocomerceProvider.relatedProducts,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/loading-image.png'),
                    image: NetworkImage(product.images.first.src),
                    width: 150,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                if (product.calculateDiscount() > 0) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/oferta-image.png',
                      alignment: AlignmentDirectional.center,
                      width: 150,
                      height: 190,
                      fit: BoxFit.fill,
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: _PriceProduct(product: product),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceProduct extends StatelessWidget {
  const _PriceProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (product.calculateDiscount() > 0) ...[
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(''),
                Text(
                  '\$${NumberFormat().thousandFormat(int.parse(product.regularPrice))}',
                  style: const TextStyle(
                    fontSize: 12,
                    decorationColor: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(''),
                Text(
                  '\$${NumberFormat().thousandFormat(int.parse(product.price))}',
                  style: const TextStyle(
                    // fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(''),
                Text(
                  '\$${NumberFormat().thousandFormat(int.parse(product.price))}',
                  style: const TextStyle(
                    // fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
