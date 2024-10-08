import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/auth/view_models/email_verification_view_view_model.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> recoverVerifyEmail({
    required String email,
    required VoidCallback clearTextFormField,
    required VoidCallback emailVerificationFailed,
    required VoidCallback emailVerificationSuccess,
    required VoidCallback onPressedEmailVerificationButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
        await EmailVerificationViewViewModel.emailVerification(email: email);

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
      AuthControllerServices.saveVerificationEmail(email);
      clearTextFormField();
      onPressedEmailVerificationButton();
      emailVerificationSuccess();
      debugPrint("Successfully sent 6 digits OTP to your email.");
    } else {
      _errorMessage = response.errorMessage ?? 'OTP send failed!. Try again.';
      debugPrint(_errorMessage);
      emailVerificationFailed();
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
