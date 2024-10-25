import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/features/tasks/view_models/update_task_view_model.dart';

class UpdateTaskController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  String _dropDownTaskStatus = " ";

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  String get dropDownTaskStatus => _dropDownTaskStatus;

  final List<String> statusList = [
    'New',
    'Completed',
    'Progress',
    'Cancelled',
  ];

  void onSelectedTaskStatus(String selectedTaskStatus) {
    _dropDownTaskStatus = selectedTaskStatus;
    update();
  }

  void getDropDownTaskStatus(String status) {
    _dropDownTaskStatus = status;
    update();
  }

  Future<bool> updateTaskItem({
    required String taskID,
    required String taskStatus,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    final NetworkResponse response =
        await UpdateTaskViewViewModel.updateTask(taskID, taskStatus);

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
