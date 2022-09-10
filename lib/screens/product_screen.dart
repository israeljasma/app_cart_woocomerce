import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Titulo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              _ProductDetail(),
              _ProductDescription(),
              // ProductSlider(),
            ],
          ),
        ));
  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.red,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: AssetImage('assets/loading.gif'),
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Lorem ipsum', overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('Lorem ipsum', overflow: TextOverflow.ellipsis, maxLines: 2),
              // Row(
              //   children: [
              //     const Icon(Icons.star_outline, size: 15, color: Colors.grey),
              //     const SizedBox(width: 5),
              //     Text('movie.voteAverage')
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.green,
      child: Column(
        children: [
          Text(
            'Descripción',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
