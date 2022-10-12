import 'package:app_cart_woocomerce/providers/providers.dart';
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
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(wocomerceProvider.categoriesList[index].name),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: wocomerceProvider.categoriesList.length,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
