import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/resources/constants/routes/app_routes.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';
import 'package:task_next_x/resources/themes/dark_shade_app_themes.dart';
import 'package:task_next_x/resources/themes/light_shade_app_themes.dart';

class TaskNextX extends StatelessWidget {
  const TaskNextX({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      initialRoute: RoutesName.splashView,
      getPages: AppRoutes.appRoutes(),
      unknownRoute: AppRoutes.unknownRoute(),
      theme: LightShadeAppThemes().lightThemeData(),
      darkTheme: DarkShadeAppThemes().darkThemeData(),
      themeMode: ThemeMode.system,
    );
  }
}
