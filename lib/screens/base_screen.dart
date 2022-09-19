import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState<T extends BaseScreen> extends State<T> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Cart Woocomerce'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: const Center(
        child: Text('BaseScreen'),
      ),
    );
  }
}
