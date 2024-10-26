import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/user_task_model/task_count_by_status_list_model.dart';
import 'package:task_next_x/app/models/user_task_model/task_count_by_status_model.dart';
import 'package:task_next_x/features/tasks/view_models/task_count_by_status_view_model.dart';

class TaskCountByStatusController extends GetxController {
  bool _inProgress = false;
  List<TaskCountByStatusModel> _taskCountByStatusList = [];
  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<TaskCountByStatusModel> get taskCountByStatusList =>
      _taskCountByStatusList;

  String? get errorMessage => _errorMessage;

  Future<bool> getTaskCountByStatus() async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await TaskCountByStatusViewModel.taskCountByStatus();

    if (response.isSuccess) {
      TaskCountByStatusListModel taskCountByStatusListModel =
          TaskCountByStatusListModel.fromJson(response.responseBody);
      _taskCountByStatusList =
          taskCountByStatusListModel.taskCountByStatusList ?? [];
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
