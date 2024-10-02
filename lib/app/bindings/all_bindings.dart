import 'package:get/get.dart';
import 'package:task_next_x/app/bindings/auth_binding.dart';
import 'package:task_next_x/app/bindings/profile_binding.dart';
import 'package:task_next_x/app/bindings/tasks_binding.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    TasksBinding().dependencies();
    AuthBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
