import 'package:flutter/material.dart';

class AppTheme {
  // static const Color primaryColor = Colors.indigo;
  static const Color primaryColor = Color.fromRGBO(128, 96, 76, 1);

  static final ThemeData lighTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
    colorScheme: const ColorScheme.light(primary: primaryColor),
  );
}
