import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/user_task_model/task_list_model.dart';
import 'package:task_next_x/app/models/user_task_model/task_model.dart';
import 'package:task_next_x/features/tasks/view_models/completed_task_view_view_model.dart';

class CompletedTaskController extends GetxController {
  bool _inProgress = false;
  List<TaskModel> _completedTaskList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<TaskModel> get completedTaskList => _completedTaskList;

  String? get errorMessage => _errorMessage;

  Future<bool> getCompletedTaskList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await CompletedTaskViewViewModel.completedTask();

    if (response.isSuccess) {
      TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseBody);
      _completedTaskList = taskListModel.taskList ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
