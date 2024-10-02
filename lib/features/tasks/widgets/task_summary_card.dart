import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.taskTitle,
    required this.taskCount,
  });

  final String taskTitle;
  final String taskCount;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return Card(
      color: isBrightness
          ? LightShadeAppColors.cardSummaryBackgroundColor
          : DarkShadeAppColors.cardSummaryBackgroundColor,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              taskCount,
              style: textTheme.titleLarge?.copyWith(fontSize: 17),
            ),
            Text(
              taskTitle,
              style: textTheme.titleLarge?.copyWith(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
