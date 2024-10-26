import 'package:task_next_x/app/models/user_task_model/task_count_by_status_model.dart';

class TaskCountByStatusListModel {
  String? status;
  List<TaskCountByStatusModel>? taskCountByStatusList;

  TaskCountByStatusListModel({this.status, this.taskCountByStatusList});

  TaskCountByStatusListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountByStatusList = <TaskCountByStatusModel>[];
      json['data'].forEach((v) {
        taskCountByStatusList!.add(TaskCountByStatusModel.fromJson(v));
      });
    }
  }
}
