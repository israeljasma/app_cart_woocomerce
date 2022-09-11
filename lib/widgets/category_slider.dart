import 'package:app_cart_woocomerce/models/models.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  final List<Category> categories;
  const CategorySlider({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (categories.isEmpty) {
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
            padding: EdgeInsets.symmetric(horizontal: 20),
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
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _ProductPoster(category: categories[index]);
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
    return Container(
      width: 150,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            if (category.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(category.image),
                  width: 150,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
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
