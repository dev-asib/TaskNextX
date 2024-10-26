import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/bindings/all_bindings.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/resources/constants/routes/app_routes.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';
import 'package:task_next_x/resources/themes/dark_shade_app_themes.dart';
import 'package:task_next_x/resources/themes/light_shade_app_themes.dart';

class TaskNextX extends StatefulWidget {
  const TaskNextX({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<TaskNextX> createState() => _TaskNextXState();
}

class _TaskNextXState extends State<TaskNextX> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      initialBinding: AllBindings(),
      navigatorKey: TaskNextX.navigatorKey,
      initialRoute: RoutesName.splashView,
      getPages: AppRoutes.appRoutes(),
      unknownRoute: AppRoutes.unknownRoute(),
      theme: LightShadeAppThemes().lightThemeData(),
      darkTheme: DarkShadeAppThemes().darkThemeData(),
      themeMode: ThemeMode.system,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
