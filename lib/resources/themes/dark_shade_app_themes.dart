import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';

class DarkShadeAppThemes {
  ThemeData darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor:
          DarkShadeAppColors.primaryScaffoldBackgroundColor,
      appBarTheme: _appBarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
      navigationBarTheme: _navigationBarThemeData(),
      chipTheme: _chipThemeData(),
      listTileTheme: _listTileThemeData(),
      floatingActionButtonTheme: _floatingActionButtonThemeData(),
      progressIndicatorTheme: _progressIndicatorThemeData(),
    );
  }

  ProgressIndicatorThemeData _progressIndicatorThemeData() {
    return ProgressIndicatorThemeData(
      color: DarkShadeAppColors.themeColor,
    );
  }

  FloatingActionButtonThemeData _floatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      elevation: 4,
      backgroundColor: DarkShadeAppColors.floatingActionButtonBackgroundColor,
      foregroundColor: DarkShadeAppColors.floatingActionButtonForegroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      iconSize: 30,
    );
  }

  ListTileThemeData _listTileThemeData() {
    return ListTileThemeData(
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: DarkShadeAppColors.listTileTitleTextColor,
        fontSize: 18,
      ),
      subtitleTextStyle: TextStyle(
        color: DarkShadeAppColors.listTileSubTitleTextColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ChipThemeData _chipThemeData() {
    return ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      backgroundColor: DarkShadeAppColors.chipBackgroundColor,
      labelStyle: const TextStyle(
        color: DarkShadeAppColors.chipTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  NavigationBarThemeData _navigationBarThemeData() {
    return NavigationBarThemeData(
      backgroundColor: DarkShadeAppColors.navigationBarBackgroundColor,
      indicatorColor: DarkShadeAppColors.navigationBarIndicatorColor,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          color: DarkShadeAppColors.navigationBarLabelTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: WidgetStateProperty.all(
        const IconThemeData(
          color: DarkShadeAppColors.navigationBarIconColor,
        ),
      ),
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
    return AppBarTheme(
      backgroundColor: DarkShadeAppColors.themeColor,
      foregroundColor: DarkShadeAppColors.appBarForegroundColor,
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
