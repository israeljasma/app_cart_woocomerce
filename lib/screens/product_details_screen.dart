import 'package:app_cart_woocomerce/models/models.dart';
import 'package:app_cart_woocomerce/providers/cart_provider.dart';
import 'package:app_cart_woocomerce/utils/utils.dart';
import 'package:app_cart_woocomerce/widgets/related_product_slider.dart';
import 'package:app_cart_woocomerce/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  List<ProductModel> relatedProduct;
  var countProducts = 1;

  ProductDetailsScreen({
    Key? key,
    required this.product,
    required this.relatedProduct,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final dataCart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: const AppBarDesign(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
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
                Column(
                  children: [
                    if (widget.product.calculateDiscount() > 0) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(''),
                          Text(
                            '\$${NumberFormat().thousandFormat(int.parse(widget.product.regularPrice))}',
                            style: const TextStyle(
                              fontSize: 20,
                              decorationColor: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(''),
                          Text(
                            '\$${NumberFormat().thousandFormat(int.parse(widget.product.price))}',
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(''),
                          Text(
                            '\$${NumberFormat().thousandFormat(int.parse(widget.product.price))}',
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStepper(
                      lowerLimit: 0,
                      upperLimit: widget.product.stockQuantity,
                      stepValue: 1,
                      iconsize: 22.0,
                      value: widget.countProducts,
                      onChaned: (value) {
                        print(value);
                        widget.countProducts = value;
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        if (widget.countProducts != 0 ||
                            widget.countProducts > 0) {
                          dataCart.addProduct(Cart(
                              product: widget.product,
                              numOfItems: widget.countProducts));
                        }
                      },
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
                RelatedProductSlider(products: widget.relatedProduct)
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
