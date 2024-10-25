import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/update_task_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class UpdateTaskMenuButtonWidget extends StatelessWidget {
  UpdateTaskMenuButtonWidget({
    super.key,
    required this.taskID,
    required this.onUpdate,
  });

  final String taskID;
  final VoidCallback onUpdate;

  final UpdateTaskController _updateTaskController =
      Get.find<UpdateTaskController>();

  @override
  Widget build(BuildContext context) {
    bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return GetBuilder<UpdateTaskController>(builder: (updateTaskController) {
      return Visibility(
        visible: !updateTaskController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: PopupMenuButton<String>(
          icon: const Icon(Icons.edit),
          iconColor: isBrightness
              ? LightShadeAppColors.themeColor
              : DarkShadeAppColors.themeColor,
          initialValue: updateTaskController.dropDownTaskStatus,
          onSelected: (String selectedValue) {
            updateTaskController.onSelectedTaskStatus(selectedValue);
            _updateTaskStatus(
              taskID: taskID,
              taskStatus: updateTaskController.dropDownTaskStatus,
              context: context,
            );
          },
          itemBuilder: (BuildContext context) {
            return updateTaskController.statusList.map((String value) {
              return PopupMenuItem<String>(
                value: value,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  color: isBrightness
                      ? LightShadeAppColors.themeColor
                      : DarkShadeAppColors.themeColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 8, right: 8),
                    title: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: updateTaskController.dropDownTaskStatus == value
                        ? Icon(
                            Icons.done,
                            color: isBrightness
                                ? LightShadeAppColors.whiteColor
                                : LightShadeAppColors.whiteColor,
                          )
                        : null,
                  ),
                ),
              );
            }).toList();
          },
        ),
      );
    });
  }

  Future<void> _updateTaskStatus(
      {required BuildContext context,
      required String taskID,
      required String taskStatus}) async {
    final bool isUpdatedTask = await _updateTaskController.updateTaskItem(
      taskID: taskID,
      taskStatus: taskStatus,
    );

    if (isUpdatedTask) {
      onUpdate();
      AlertHelper.showFlushBarMessage(
        title: "Congratulations",
        message: "Your task updated to $taskStatus",
        isError: false,
      );
    } else {
      onUpdate();
      AlertHelper.showFlushBarMessage(
        title: "Failed",
        message: "Your task update failed! Try again.",
        isError: true,
      );
    }
  }
}
