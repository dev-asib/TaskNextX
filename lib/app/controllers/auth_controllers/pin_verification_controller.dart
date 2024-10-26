import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/auth/view_models/pin_verification_view_view_model.dart';

class PinVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> recoverVerifyOTP({
    required String email,
    required String otp,
    required VoidCallback clearTextFormField,
    required VoidCallback otpVerificationFailed,
    required VoidCallback otpVerificationSuccess,
    required VoidCallback onPressedOtpVerificationButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
        await PinVerificationViewViewModel.pinVerification(
      email: email,
      otp: otp,
    );

    _inProgress = false;
    update();

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      final AuthControllerServices authControllerServices =
          Get.find<AuthControllerServices>();
     await authControllerServices.saveVerifyOtp(otp);
     await authControllerServices.saveVerificationEmail(email);

      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedOtpVerificationButton();
      otpVerificationSuccess();
      debugPrint("successfully OTP Verified.");
    } else {
      _errorMessage =
          response.errorMessage ?? 'Failed to verify OTP! Try again.';
      debugPrint(_errorMessage);
      otpVerificationFailed();
    }

    return isSuccess;
  }
}
