import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class LightShadeAppThemes {
  ThemeData lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: LightShadeAppColors.scaffoldBackgroundColor,
      appBarTheme: _appBarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightShadeAppColors.grey,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightShadeAppColors.themeColor,
        foregroundColor: LightShadeAppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        fixedSize: const Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      titleLarge: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: LightShadeAppColors.titleLargeTextColor,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
        color: LightShadeAppColors.titleSmallTextColor,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: LightShadeAppColors.richTextColor,
      ),
    );
  }

  AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: LightShadeAppColors.themeColor,
      foregroundColor: Colors.white,
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: LightShadeAppColors.textFormFieldFillColor,
      filled: true,
      prefixIconColor: LightShadeAppColors.themeColor,
      suffixIconColor: LightShadeAppColors.themeColor,
      hintStyle: const TextStyle(
        color: LightShadeAppColors.textFormFieldHintTextColor,
        fontWeight: FontWeight.bold,
      ),
      border: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      errorBorder: _outlineInputBorder(
        borderSideColor: LightShadeAppColors.redColor,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder({Color? borderSideColor}) {
    return OutlineInputBorder(
      borderSide: borderSideColor != null
          ? BorderSide(
              color: borderSideColor,
              width: 1,
            )
          : BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
