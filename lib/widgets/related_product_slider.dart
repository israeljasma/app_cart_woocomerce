import 'package:app_cart_woocomerce/models/models.dart';
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

    return Container(
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
                return _ProductPoster(
                  product: product,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ProductPoster extends StatelessWidget {
  ProductModel product;
  _ProductPoster({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProductDetailsScreen(product: product),
          //   ),
          // );
        }
        // => Navigator.pushNamed(context, 'productDetails',
        //     arguments: 'product-instance')
        ,
        child: Column(
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
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                product.price,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
