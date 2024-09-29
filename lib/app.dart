import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/resources/constants/routes/app_routes.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class TaskNextX extends StatelessWidget {
  const TaskNextX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesName.splashView,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
