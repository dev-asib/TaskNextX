import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/email_verification_controller.dart';
import 'package:task_next_x/app/controllers/auth_controllers/pin_verification_controller.dart';
import 'package:task_next_x/app/controllers/auth_controllers/reset_password_controller.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_in_controller.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_up_controller.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(EmailVerificationController());
    Get.put(PinVerificationController());
    Get.put(ResetPasswordController());
    Get.put(AuthControllerServices());
  }
}
