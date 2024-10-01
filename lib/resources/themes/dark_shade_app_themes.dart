import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';

class DarkShadeAppThemes {
  ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: DarkShadeAppColors.scaffoldBackgroundColor,
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
        foregroundColor: DarkShadeAppColors.greyColor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkShadeAppColors.themeColor,
        foregroundColor: DarkShadeAppColors.whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        fixedSize: const Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      titleLarge: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: DarkShadeAppColors.titleLargeTextColor,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
        color: DarkShadeAppColors.titleSmallTextColor,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: DarkShadeAppColors.bodyLargeTextColor,
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        color: DarkShadeAppColors.titleMediumTextColor,
      ),
    );
  }

  AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: DarkShadeAppColors.themeColor,
      foregroundColor: Colors.white,
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: DarkShadeAppColors.textFormFieldFillColor,
      filled: true,
      prefixIconColor: DarkShadeAppColors.themeColor,
      suffixIconColor: DarkShadeAppColors.themeColor,
      hintStyle: const TextStyle(
        color: DarkShadeAppColors.textFormFieldHintTextColor,
        fontWeight: FontWeight.bold,
      ),
      labelStyle: const TextStyle(
        color: DarkShadeAppColors.textFormFieldLabelTextColor,
        fontWeight: FontWeight.bold,
      ),
      border: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      errorBorder: _outlineInputBorder(
        borderSideColor: DarkShadeAppColors.redColor,
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
