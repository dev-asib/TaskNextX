import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class SignUpViewViewModel {
  static Future<NetworkResponse> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
  }) async {
    Map<String, dynamic> requestData = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    };
    final NetworkResponse response = await Get.find<NetworkServices>().postRequest(
      ApiUrls.registration,
      body: requestData,
    );

    return response;
  }
}
