import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  final List<Category> categories;
  final Function onNextPage;
  const CategorySlider({
    Key? key,
    required this.categories,
    required this.onNextPage,
  }) : super(key: key);

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        print(scrollController.position.maxScrollExtent -
            scrollController.position.maxScrollExtent);
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categories.isEmpty) {
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
            child: Text(
              'Categorias',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (_, index) {
                return _ProductPoster(category: widget.categories[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ProductPoster extends StatelessWidget {
  final Category category;
  const _ProductPoster({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final providersAPI = Provider.of<WoocomerceProvider>(context);
    return Container(
      width: 150,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ProductScreen(
          //         onNextPage: () => providersAPI.getOnDisplayWoocomerce(
          //             categoryId: '$category')
          //             ),
          //   ),
          // );
        },
        child: Column(
          children: [
            if (category.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading-image.png'),
                  image: NetworkImage(category.image!.src),
                  width: 150,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/loading-image.png'),
                  image: AssetImage('assets/no-image.png'),
                  width: 150,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                category.name,
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
