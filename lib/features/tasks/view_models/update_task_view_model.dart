import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class UpdateTaskViewViewModel {
  static Future<NetworkResponse> updateTask(
      String taskID, String taskStatus) async {
    final NetworkResponse response =
        await Get.find<NetworkServices>().getRequest(
      ApiUrls.updateTasksStatus(taskID, taskStatus),
    );

    return response;
  }
}
