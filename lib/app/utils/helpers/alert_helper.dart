import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class AlertHelper {
  static void showFlushBarMessage({
    required BuildContext context,
    required String title,
    required String message,
    Color? backgroundColor,
  }) async {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    Flushbar(
      titleText: Text(
        title,
        style: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: isBrightness
              ? LightShadeAppColors.anotherFlushBarTitleColor
              : DarkShadeAppColors.anotherFlushBarTitleColor,
        ),
      ),
      messageText: Text(
        message,
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: isBrightness
              ? LightShadeAppColors.anotherFlushBarMessageColor
              : DarkShadeAppColors.anotherFlushBarMessageColor,
        ),
      ),
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: EdgeInsets.all(SizeConfig.screenWidth! * 0.0486),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: backgroundColor ??
          (isBrightness
              ? LightShadeAppColors.anotherFlushBackgroundColor
              : DarkShadeAppColors.anotherFlushBackgroundColor),
    )..show(context);
  }
}
