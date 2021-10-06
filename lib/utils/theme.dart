import 'package:flutter/material.dart';
import 'package:plantshop/utils/color.dart';

class ThemeStyle {
  static ThemeData themeDta() {
    return ThemeData(
      primaryColor: Colors.green,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(kgreen.withOpacity(0.5)),
        isAlwaysShown: true,
        mainAxisMargin: 200,
        radius: const Radius.circular(50.0),
      ),
    );
  }
}