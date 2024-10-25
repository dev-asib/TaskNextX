import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/features/tasks/view_models/delete_task_view_model.dart';

class DeleteTaskController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> deleteTaskItem(String taskID) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await DeleteTaskViewModel.deleteTask(taskID);

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
