import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static TextTheme? textTheme;

  void init(BuildContext context) {
    if (context.mounted) {
      _mediaQueryData = MediaQuery.of(context);
      screenWidth = _mediaQueryData!.size.width;
      debugPrint(screenWidth.toString());
      screenHeight = _mediaQueryData!.size.height;
      debugPrint(screenHeight.toString());
      textTheme = Theme.of(context).textTheme;
    }
  }
}
