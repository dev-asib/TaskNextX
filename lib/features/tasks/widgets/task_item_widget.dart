import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 3,
        color: isBrightness
            ? LightShadeAppColors.taskItemBackgroundColor
            : DarkShadeAppColors.taskItemBackgroundColor,
        child: ListTile(
          title: const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Lorum Ipsum is simplyfy dummy"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Lorum Ipsum is simplyfy dummy Lorum Ipsum is simplyfy dummy. Lorum Ipsum is simplyfy dummy Lorum Ipsum is simplyfy dummy.'),
              const Text("24/09.2024"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Chip(
                    label: Text("Label"),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
