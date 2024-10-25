import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/tasks/task_list_model.dart';
import 'package:task_next_x/app/models/tasks/task_model.dart';
import 'package:task_next_x/features/tasks/view_models/in_progress_task_view_view_model.dart';

class InProgressTaskController extends GetxController {
  bool _inProgress = false;
  List<TaskModel> _inProgressTaskList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<TaskModel> get inProgressTaskList => _inProgressTaskList;

  String? get errorMessage => _errorMessage;

  Future<bool> getInProgressTaskList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await InProgressTaskViewViewModel.inProgressTask();

    if (response.isSuccess) {
      TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseBody);
      _inProgressTaskList = taskListModel.taskList ?? [];
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
