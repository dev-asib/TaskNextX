import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class ResetPasswordViewViewModel {
  static Future<NetworkResponse> resetPasswordUser({
    required Map<String, dynamic> requestData,
  }) async {
    final NetworkResponse response =
        await Get.find<NetworkServices>().postRequest(
      ApiUrls.recoverResetPassword,
      body: requestData,
    );
    return response;
  }
}
