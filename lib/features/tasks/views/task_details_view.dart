import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/date/date_formatter.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: _buildAppBar(textTheme, isBrightness),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.arguments['title'],
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Text(
                DateFormatter.formatDate(Get.arguments['date']),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isBrightness
                          ? LightShadeAppColors.themeColor
                          : DarkShadeAppColors.themeColor,
                    ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.020),
              Text(
                Get.arguments['description'],
                textAlign: TextAlign.justify,
                style: textTheme.titleMedium?.copyWith(
                  color: isBrightness
                      ? LightShadeAppColors.blackColor
                      : DarkShadeAppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(TextTheme textTheme, bool isBrightness) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        "Task Details",
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: isBrightness
              ? LightShadeAppColors.whiteColor
              : DarkShadeAppColors.whiteColor,
        ),
      ),
    );
  }
}
