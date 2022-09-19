import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Cart Woocomerce'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ProductPoster(
                    product: product,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProductPoster extends StatelessWidget {
  final ProductModel product;
  const _ProductPoster({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 220,
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
// import 'package:flutter/material.dart';

// import '../widgets/widgets.dart';

// class ProductScreen extends StatelessWidget {
//   const ProductScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Titulo'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: const <Widget>[
//             _ProductDetail(),
//             _ProductDescription(),
//             // ProductSlider(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ProductDetail extends StatelessWidget {
//   const _ProductDetail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       color: Colors.red,
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: const FadeInImage(
//               placeholder: AssetImage('loading-image.png'),
//               image: AssetImage('loading-image.png'),
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text('Lorem ipsum', overflow: TextOverflow.ellipsis, maxLines: 2),
//               Text('Lorem ipsum', overflow: TextOverflow.ellipsis, maxLines: 2),
//               // Row(
//               //   children: [
//               //     const Icon(Icons.star_outline, size: 15, color: Colors.grey),
//               //     const SizedBox(width: 5),
//               //     Text('movie.voteAverage')
//               //   ],
//               // )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProductDescription extends StatelessWidget {
//   const _ProductDescription({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       color: Colors.green,
//       child: Column(
//         children: [
//           Text(
//             'Descripción',
//             textAlign: TextAlign.start,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
//             textAlign: TextAlign.justify,
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//         ],
//       ),
//     );
//   }
// }
