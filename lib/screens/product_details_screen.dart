import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/utils/utils.dart';
import 'package:app_cart_woocomerce/widgets/related_product_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cambiar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _ImageProductSlider(images: widget.product.images),
                const SizedBox(height: 10),
                Visibility(
                  visible: widget.product.calculateDiscount() > 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Text(
                        '${widget.product.calculateDiscount()}% OFF',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStepper(
                      lowerLimit: 0,
                      upperLimit: 20,
                      stepValue: 1,
                      iconsize: 22.0,
                      value: 0,
                      onChaned: (value) {
                        print(value);
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.all(15),
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Agregar al carrito',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                ExpandText(
                  labelHeader: "Descripción de producto",
                  desc: widget.product.description,
                  shortDesc: widget.product.shortDescription,
                ),
                const Divider(),
                const SizedBox(height: 10),
                // RelatedProductSlider(labelName: 'labelName', products: products)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageProductSlider extends StatelessWidget {
  final List<ImageModel> images;
  final CarouselController _controller = CarouselController();
  _ImageProductSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) => FadeInImage(
                  placeholder: const AssetImage('assets/loading-image.png'),
                  image: NetworkImage(images[index].src),
                  fit: BoxFit.fill),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 1.0,
              ),
              carouselController: _controller,
            ),
          ),
          Positioned(
            top: 100,
            child: IconButton(
              onPressed: () {
                _controller.previousPage();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width - 80,
            child: IconButton(
              onPressed: () {
                _controller.nextPage();
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
