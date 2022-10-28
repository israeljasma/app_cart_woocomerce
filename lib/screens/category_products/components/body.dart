import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final String categoryID;
  const Body({
    Key? key,
    required this.categoryID,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late WoocomerceProvider woocomerceAPI;

  @override
  void initState() {
    woocomerceAPI = Provider.of<WoocomerceProvider>(context, listen: false);
    woocomerceAPI.getCategoryProductsList(widget.categoryID);
    super.initState();
  }

  @override
  void dispose() {
    woocomerceAPI.resetCategoryProductsListParameters();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WoocomerceProvider>(
        builder: (context, wocomerceProvider, child) {
          if (wocomerceProvider.categoryProductsList.isNotEmpty) {
            return _ProductList(
              products: wocomerceProvider.categoryProductsList,
              onNextPage: () =>
                  wocomerceProvider.getCategoryProductsList(widget.categoryID),
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
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        fecthData();
        setState(() {});
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
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              itemCount: widget.products.length,
              itemBuilder: (BuildContext context, int index) {
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
