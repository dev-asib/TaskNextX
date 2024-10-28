import 'package:get/get.dart';
import 'package:task_next_x/app/bindings/auth_binding.dart';
import 'package:task_next_x/app/bindings/profile_binding.dart';
import 'package:task_next_x/app/bindings/tasks_binding.dart';
import 'package:logger/logger.dart';
import 'package:task_next_x/app/controllers/connectivity_controllers/connectivity_controller.dart';
import 'package:task_next_x/app/services/logger_service.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    /// Logger setup
    Get.put(Logger());
    Get.put(LoggerService(logger: Get.find<Logger>()));

    /// NetworkCaller with LoggerService
    Get.put(NetworkServices(loggerService: Get.find<LoggerService>()));

    /// Others Dependencies
    TasksBinding().dependencies();
    AuthBinding().dependencies();
    ProfileBinding().dependencies();

    /// AuthServices
    Get.put(AuthControllerServices());

    // ConnectivityController
    Get.put(ConnectivityController());

  }
}
