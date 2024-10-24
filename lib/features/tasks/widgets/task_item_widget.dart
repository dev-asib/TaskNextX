import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/delete_task_controller.dart';
import 'package:task_next_x/app/models/tasks/task_model.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class TaskItemWidget extends StatefulWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel,
    required this.onUpdate,
  });

  final TaskModel taskModel;
  final VoidCallback onUpdate;

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
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
          title: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            widget.taskModel.title ?? 'Unknown Title',
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                widget.taskModel.description ?? 'Unknown Description',
              ),
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
                        onPressed: _deleteTask,
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: _deleteTask,
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

  Future<void> _deleteTask() async {
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    bool isItemDeleted = await Get.find<DeleteTaskController>()
        .deleteTaskItem(widget.taskModel.sId!);
    if (isItemDeleted) {
      widget.onUpdate();
      if (mounted) {
        AlertHelper.showFlushBarMessage(
          context: context,
          title: "Congratulations",
          message: "Item successfully deleted",
        );
      }
    } else {
      if (mounted) {
        AlertHelper.showFlushBarMessage(
          context: context,
          title: "Warning",
          message: "item not deleted! Try again.",
          backgroundColor: isBrightness
              ? LightShadeAppColors.redColor
              : DarkShadeAppColors.redColor,
        );
      }
    }
  }
}
