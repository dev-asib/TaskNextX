import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/delete_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/update_task_controller.dart';
import 'package:task_next_x/app/models/user_task_model/task_model.dart';
import 'package:task_next_x/app/utils/date/date_formatter.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/pop_up_menu_button_widget.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UpdateTaskController>()
          .getDropDownTaskStatus(widget.taskModel.status!);
    });
  }

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
              const SizedBox(height: 8),
              Text(
                DateFormatter.formatDate(widget.taskModel.createdDate),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isBrightness
                          ? LightShadeAppColors.themeColor
                          : DarkShadeAppColors.themeColor,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    label: Text(widget.taskModel.status ?? 'New'),
                  ),
                  Row(
                    children: [
                      _deleteTaskButton(),
                      UpdateTaskMenuButtonWidget(
                        taskID: widget.taskModel.sId ?? '',
                        onUpdate: widget.onUpdate,
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

  Widget _deleteTaskButton() {
    return GetBuilder<DeleteTaskController>(builder: (deleteTaskController) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;
      return Visibility(
        visible: !deleteTaskController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: IconButton(
          onPressed: _deleteTask,
          icon: Icon(
            Icons.delete,
            color: isBrightness
                ? LightShadeAppColors.redColor
                : DarkShadeAppColors.redColor,
          ),
        ),
      );
    });
  }

  Future<void> _deleteTask() async {
    bool isItemDeleted = await Get.find<DeleteTaskController>()
        .deleteTaskItem(widget.taskModel.sId!);
    if (isItemDeleted) {
      widget.onUpdate();
      AlertHelper.showFlushBarMessage(
        title: "Congratulations",
        message: "Item successfully deleted",
        isError: false,
      );
    } else {
      AlertHelper.showFlushBarMessage(
        title: "Warning",
        message: "item not deleted! Try again.",
        isError: true,
      );
    }
  }
}
