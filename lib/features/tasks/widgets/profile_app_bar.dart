import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

AppBar profileAppBar(BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final bool isBrightness = Theme.of(context).brightness == Brightness.light;
  return AppBar(
    automaticallyImplyLeading: false,
    title: GestureDetector(
      onTap:_onTapAbbBarProfile,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.person,
            size: 30,
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.0194),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dev Asib",
                style: textTheme.bodyLarge?.copyWith(
                  color: isBrightness
                      ? LightShadeAppColors.appBarForegroundColor
                      : DarkShadeAppColors.appBarForegroundColor,
                ),
              ),
              Text(
                "dev.asib.com@gmail.com",
                style: textTheme.bodyLarge?.copyWith(
                  color: isBrightness
                      ? LightShadeAppColors.appBarForegroundColor
                      : DarkShadeAppColors.appBarForegroundColor,
                ),
              )
            ],
          ),
        ],
      ),
    ),
    actions: const [
      IconButton(
        onPressed: _onTapLogoutButton,
        icon: Icon(
          Icons.logout,
          size: 30,
        ),
      ),
    ],
  );
}

void _onTapAbbBarProfile(){
  Get.toNamed(RoutesName.updateProfileView);
}

void _onTapLogoutButton() {
  Get.toNamed(RoutesName.signInView);
}
