import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/bottom_nav_main_view_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavMainViewController());
  }
}
