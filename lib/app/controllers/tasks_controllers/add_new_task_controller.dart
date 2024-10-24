import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/new_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/task_count_by_status_controller.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/features/tasks/view_models/add_new_task_view_view_model.dart';

class AddNewTaskController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> addNewTask({
    required String title,
   required String description,
    required VoidCallback clearTextFormField,
    required VoidCallback addToFailedTask,
    required VoidCallback addToSuccessTask,
    required VoidCallback onPressedAddButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response = await AddNewTaskViewViewModel.addTask(
      title: title,
      description: description,
    );

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedAddButton();
      addToSuccessTask();
      Get.find<NewTaskController>().getNewTaskList();
      Get.find<TaskCountByStatusController>().getTaskCountByStatus();
      debugPrint("Task added");
    } else {
      _errorMessage = response.errorMessage;
      addToFailedTask();
      debugPrint(_errorMessage);
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
