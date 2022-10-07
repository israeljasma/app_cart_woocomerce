import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final woocomerceProvider = Provider.of<WoocomerceProvider>(context);
    return Scaffold(
      body: Consumer<WoocomerceProvider>(
        builder: (context, wocomerceProvider, child) {
          if (wocomerceProvider.onDisplayProducts.isNotEmpty) {
            return _ProductList(
              products: wocomerceProvider.onDisplayProducts,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // FutureBuilder(
      //   future: woocomerceProvider.getProducts2(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else {
      //       return _ProductList(products: snapshot.data);
      //     }
      //   },
      // ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final List<ProductModel> products;
  const _ProductList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  height: 220,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/loading-image.png'),
                            image:
                                NetworkImage(products[index].images.first.src),
                            width: 150,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Flexible(
                          child: Text(
                            products[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Flexible(
                          child: Text(
                            products[index].price,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _ProductList extends StatefulWidget {
//   List<ProductModel> products;
//   _ProductList({
//     Key? key,
//     required this.products,
//   }) : super(key: key);

//   @override
//   State<_ProductList> createState() => _ProductListState();
// }

// class _ProductListState extends State<_ProductList> {
//   final ScrollController scrollController = ScrollController();
//   bool isLoading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//           scrollController.position.maxScrollExtent - 300) {
//         print(scrollController.position.pixels);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _productFilters(),
//           const SizedBox(height: 5),
//           Expanded(
//             child: GridView.builder(
//               controller: scrollController,
//               scrollDirection: Axis.vertical,
//               itemCount: widget.products.length,
//               itemBuilder: (context, index) {
//                 final product = widget.products[index];
//                 return _ProductPoster(product: product);
//               },
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisExtent: 250,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
        onTap: () {},
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

class _productFilters extends StatelessWidget {
  const _productFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.black12,
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _productFilters() {
//   return Container(
//     height: 51,
//     margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
//     child: Row(
//       children: [
//         Flexible(
//           child: TextField(
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search),
//               hintText: 'Buscar',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 borderSide: BorderSide.none,
//               ),
//               fillColor: Colors.black12,
//               filled: true,
//             ),
//           ),
//         ),
//         const SizedBox(width: 15),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.black12,
//             borderRadius: BorderRadius.circular(9),
//           ),
//           // child: PopupMenuButton(
//           //   onSelected: (value) {},
//           //   itemBuilder: (BuildContext context) {
//           //     return _sortByOptions.map((item){
//           //       return PopupMenuItem(
//           //         value: item,
//           //         child: Container(
//           //           child: Text(item.text),
//           //         ),),
//           //     })
//           //   },
//           // ),
//         ),
//       ],
//     ),
//   );
// }
