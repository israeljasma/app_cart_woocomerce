import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/utils/utils.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WoocomerceProvider>(
        builder: (context, wocomerceProvider, child) {
          if (wocomerceProvider.onDisplayProducts.isNotEmpty) {
            return _ProductList(
              products: wocomerceProvider.onDisplayProducts,
              onNextPage: () => wocomerceProvider.getProducts(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _ProductList extends StatefulWidget {
  final List<ProductModel> products;
  final Function onNextPage;
  const _ProductList({
    Key? key,
    required this.products,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        fecthData();
        setState(() {});
        // print(scrollController.position.pixels);
      }
    });
    super.initState();
  }

  Future fecthData() async {
    if (isLoading) return;
    isLoading = true;
    widget.onNextPage();
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductFilters(),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return ProductPoster(
                  product: widget.products[index],
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

class _ProductFilters extends StatelessWidget {
  _ProductFilters({
    Key? key,
  }) : super(key: key);
  final Map<SortBy, int> parameters = {
    SortBy('popularity', 'Popular', 'asc'): 1,
    SortBy('modified', 'Ultimos Agregados', 'asc'): 2,
    SortBy('price', 'Precio: Alto a Bajo', 'desc'): 3,
    SortBy('price', 'Precio: Bajo a Alto', 'asc'): 4,
  };

  @override
  Widget build(BuildContext context) {
    var _productList = Provider.of<WoocomerceProvider>(context, listen: false);
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
              onChanged: (value) {
                _productList.getSuggestionByQueryTest(value);
                // print(value);
              },
              // onSubmitted: (value) {
              //   print(value);
              // },
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(9),
            ),
            child: PopupMenuButton<SortBy>(
              icon: const Icon(Icons.sort_outlined),
              onSelected: (value) {
                _productList.resetProductsParameters();
                _productList.setProductsParameters(
                    orderBy: value.orderBy, sortOrder: value.sortOrder);
                _productList.getProducts();
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<SortBy>>[
                  PopupMenuItem<SortBy>(
                    value: parameters.keys.elementAt(0),
                    child: Text(parameters.keys.elementAt(0).text),
                  ),
                  PopupMenuItem<SortBy>(
                    value: parameters.keys.elementAt(1),
                    child: Text(parameters.keys.elementAt(1).text),
                  ),
                  PopupMenuItem<SortBy>(
                    value: parameters.keys.elementAt(2),
                    child: Text(parameters.keys.elementAt(2).text),
                  ),
                  PopupMenuItem<SortBy>(
                    value: parameters.keys.elementAt(3),
                    child: Text(parameters.keys.elementAt(3).text),
                  ),
                ];
              },
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
