import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class UpdateProfileViewViewModel {
  static Future<NetworkResponse> updateProfile({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
  }) async {
    Map<String, dynamic> requestData = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };

    if (password.isNotEmpty) {
      requestData["password"] = password;
    }

    final NetworkResponse response =
        await Get.find<NetworkServices>().postRequest(
      ApiUrls.profileUpdate,
      body: requestData,
    );

    return response;
  }
}
