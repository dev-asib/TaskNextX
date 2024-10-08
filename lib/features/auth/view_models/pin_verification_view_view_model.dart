import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/services/network_services.dart';
import 'package:task_next_x/resources/constants/api_urls.dart';

class PinVerificationViewViewModel {
  static Future<NetworkResponse> pinVerification({
    required String email,
    required String otp,
  }) async {
    final NetworkResponse response =
    await Get.find<NetworkServices>().getRequest(
      ApiUrls.recoverVerifyOtp(email, otp),
    );
    return response;
  }
}
