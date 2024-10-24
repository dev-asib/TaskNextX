import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class SignInViewViewModel {
  static Future<NetworkResponse> signIn({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> requestData = {
      "email": email,
      "password": password,
    };

    final NetworkResponse response =
    await Get.find<NetworkServices>().postRequest(
      ApiUrls.logIn,
      body: requestData,
    );
    return response;
  }
}