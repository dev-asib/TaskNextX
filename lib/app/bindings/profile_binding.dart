import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/profile_controllers/update_profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateProfileController());
  }
}
