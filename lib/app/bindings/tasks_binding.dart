import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/add_new_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/bottom_nav_main_view_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/cancelled_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/completed_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/delete_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/inprogress_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/new_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/task_count_by_status_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/update_task_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavMainViewController());
    Get.put(AddNewTaskController());
    Get.put(TaskCountByStatusController());
    Get.put(NewTaskController());
    Get.put(DeleteTaskController());
    Get.put(CompletedTaskController());
    Get.put(UpdateTaskController());
    Get.put(InProgressTaskController());
    Get.put(CancelledTaskController());
  }
}
