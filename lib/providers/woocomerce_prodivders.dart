import 'package:flutter/material.dart';

class WoocomerceProvider extends ChangeNotifier {
  WoocomerceProvider() {
    print('WoocomerceProvider inicializado');
    getOnDisplayWoocomerce();
  }

  getOnDisplayWoocomerce() async {
    print('getOnDisplayWoocomerce');
  }
}
