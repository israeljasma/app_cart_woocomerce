import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/woocomerce_providers.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.storefront_outlined,
        color: Colors.black38,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final woocomerceProvider =
        Provider.of<WoocomerceProvider>(context, listen: false);
    woocomerceProvider.getSuggestionByQuery(query);
    return StreamBuilder(
      stream: woocomerceProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final product = snapshot.data;
        return ListView.separated(
          itemCount: product!.length,
          itemBuilder: (_, index) => _ProductItem(product: product[index]),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1),
        );
      },
    );
  }
}

class _ProductItem extends StatelessWidget {
  final ProductModel product;
  const _ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final woocomerceProvider = Provider.of<WoocomerceProvider>(context);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.png'),
          image: NetworkImage(product.images.first.src),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(product.name),
      // subtitle: ,
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
    );
  }
}
