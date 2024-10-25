import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/tasks/task_list_model.dart';
import 'package:task_next_x/app/models/tasks/task_model.dart';
import 'package:task_next_x/features/tasks/view_models/cancelled_task_view_view_model.dart';

class CancelledTaskController extends GetxController {
  bool _inProgress = false;
  List<TaskModel> _cancelledTaskList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<TaskModel> get cancelledTaskList => _cancelledTaskList;

  String? get errorMessage => _errorMessage;

  Future<bool> getCancelledTaskList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await CancelledTaskViewViewModel.cancelledTask();

    if (response.isSuccess) {
      TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseBody);
      _cancelledTaskList = taskListModel.taskList ?? [];
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
