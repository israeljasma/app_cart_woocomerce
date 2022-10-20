import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RelatedProductSlider extends StatelessWidget {
  RelatedProductSlider({
    Key? key,
    // required this.labelName,
    required this.products,
  }) : super(key: key);

  // final String labelName;
  List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (products.isEmpty) {
      return Container(
        width: double.infinity,
        height: 270,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text('Productos relacionados',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductPoster(
                    product: product,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
