import 'package:task_next_x/app/models/user_task_model/task_model.dart';

class TaskListModel {
  String? status;
  List<TaskModel>? taskList;

  TaskListModel({this.status, this.taskList});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskList = <TaskModel>[];
      json['data'].forEach((v) {
        taskList!.add(TaskModel.fromJson(v));
      });
    }
  }
}
