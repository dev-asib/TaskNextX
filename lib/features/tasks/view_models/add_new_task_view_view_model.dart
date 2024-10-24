import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class AddNewTaskViewViewModel {
  static Future<NetworkResponse> addTask({
    required String title,
    required String description,
  }) async {
    Map<String, dynamic> requestData = {
      'title': title,
      'description': description,
      "status":"New"
    };

    final NetworkResponse response =
        await Get.find<NetworkServices>().postRequest(
      ApiUrls.createTask,
      body: requestData,
    );

    return response;
  }
}
