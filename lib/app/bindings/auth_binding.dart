import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_in_controller.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
  }
}
