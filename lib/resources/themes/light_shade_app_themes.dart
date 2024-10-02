import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class LightShadeAppThemes {
  ThemeData lightThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: LightShadeAppColors.primaryScaffoldBackgroundColor,
      appBarTheme: _appBarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      textButtonTheme: _textButtonThemeData(),
      navigationBarTheme: _navigationBarThemeData(),
      chipTheme: _chipThemeData(),
      listTileTheme: _listTileThemeData(),
      floatingActionButtonTheme: _floatingActionButtonThemeData(),
    );
  }

  FloatingActionButtonThemeData _floatingActionButtonThemeData(){
    return  FloatingActionButtonThemeData(
      elevation: 4,
      backgroundColor: LightShadeAppColors.floatingActionButtonBackgroundColor,
      foregroundColor: LightShadeAppColors.floatingActionButtonForegroundColor,
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
        color: LightShadeAppColors.listTileTitleTextColor,
        fontSize: 18,
      ),
      subtitleTextStyle: TextStyle(
        color: LightShadeAppColors.listTileSubTitleTextColor,
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
      backgroundColor: LightShadeAppColors.chipBackgroundColor,
      labelStyle: const TextStyle(
        color: LightShadeAppColors.chipTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  NavigationBarThemeData _navigationBarThemeData() {
    return NavigationBarThemeData(
      backgroundColor: LightShadeAppColors.navigationBarBackgroundColor,
      indicatorColor: LightShadeAppColors.navigationBarIndicatorColor,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          color: LightShadeAppColors.navigationBarLabelTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: WidgetStateProperty.all(
        const IconThemeData(
          color: LightShadeAppColors.navigationBarIconColor,
        ),
      ),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightShadeAppColors.greyColor,
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
        foregroundColor: LightShadeAppColors.whiteColor,
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
        color: LightShadeAppColors.bodyLargeTextColor,
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.bold,
        color: LightShadeAppColors.titleMediumTextColor,
      ),
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: LightShadeAppColors.themeColor,
      foregroundColor: LightShadeAppColors.appBarForegroundColor,
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
      labelStyle: const TextStyle(
        color: LightShadeAppColors.textFormFieldLabelTextColor,
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
