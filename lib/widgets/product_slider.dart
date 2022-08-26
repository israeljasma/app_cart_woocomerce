import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 265,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Lorem ipmsum',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, index) => const _ProductPoster(),
            ),
          )
        ],
      ),
    );
  }
}

class _ProductPoster extends StatelessWidget {
  const _ProductPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'product',
            arguments: 'product-instance'),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: AssetImage('assets/jar-loading.gif'),
                width: 150,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            const Flexible(
              child: Text(
                'Titulo',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            const Flexible(
              child: Text(
                'Valor',
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
