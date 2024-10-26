import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

AppBar profileAppBar(BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final bool isBrightness = Theme.of(context).brightness == Brightness.light;

  return AppBar(
    automaticallyImplyLeading: false,
    title: GestureDetector(
      onTap: _onTapAbbBarProfile,
      child:
      GetBuilder<AuthControllerServices>(builder: (authControllerServices) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: authControllerServices.encodedProfilePhoto.isNotEmpty
                    ? Image.memory(
                  base64Decode(
                      authControllerServices.encodedProfilePhoto),
                  fit: BoxFit.fill,
                )
                    : const Icon(Icons.person),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.0194),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${authControllerServices.userData?.firstName ?? 'Invalid first name'} ${authControllerServices.userData?.lastName ?? 'Invalid last name'}",
                  style: textTheme.bodyLarge?.copyWith(
                    color: isBrightness
                        ? LightShadeAppColors.appBarForegroundColor
                        : DarkShadeAppColors.appBarForegroundColor,
                  ),
                ),
                Text(
                  authControllerServices.userData?.email ?? 'Invalid email',
                  style: textTheme.bodyLarge?.copyWith(
                    color: isBrightness
                        ? LightShadeAppColors.appBarForegroundColor
                        : DarkShadeAppColors.appBarForegroundColor,
                  ),
                )
              ],
            ),
          ],
        );
      }),
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

void _onTapAbbBarProfile() {
  final AuthControllerServices authControllerServices =
  Get.find<AuthControllerServices>();
  Get.toNamed(RoutesName.updateProfileView, arguments: {
    "firstName": authControllerServices.userData!.firstName ?? '',
    "lastName": authControllerServices.userData!.lastName ?? '',
    "email": authControllerServices.userData!.email ?? '',
    "mobile": authControllerServices.userData!.mobile ?? '',
    "password": authControllerServices.userData!.password ?? '',
  });
}

void _onTapLogoutButton() {
  Get.find<AuthControllerServices>().clearAllData();
  Get.offAllNamed(RoutesName.signInView);
}
