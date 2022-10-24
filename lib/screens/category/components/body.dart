import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/providers.dart';
import 'package:app_cart_woocomerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WoocomerceProvider>(
        builder: (context, wocomerceProvider, child) {
          if (wocomerceProvider.categoriesList.isNotEmpty) {
            return CategoryList(
              onNextPage: () => wocomerceProvider.getCategoriesList(),
              category: wocomerceProvider.categoriesList,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final List<Category> category;
  final Function onNextPage;
  const CategoryList({
    Key? key,
    required this.onNextPage,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.category[index].name),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        onTap: () {
          Navigator.pushNamed(context, CategoryProductsScreen.routeName,
              arguments: (widget.category[index].id).toString());
        },
      ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: widget.category.length,
    );
  }
}
