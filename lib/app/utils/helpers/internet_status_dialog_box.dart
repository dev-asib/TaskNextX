import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

void internetStatusDialogBox(VoidCallback onPressed) {
  bool isBrightness = Theme.of(Get.context!).brightness == Brightness.light;
  if (Get.isDialogOpen == true) return;
  Get.dialog(
    AlertDialog(
      backgroundColor: isBrightness
          ? LightShadeAppColors.whiteColor
          : DarkShadeAppColors.greyColor,
      title: const Text("No Internet Connection"),
      content: const Text(
          "It looks like you're not connected to the internet. Please check your connection to continue using the app."),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text("Got it"),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
