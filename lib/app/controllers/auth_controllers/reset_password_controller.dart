import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/features/auth/view_models/reset_password_view_view_model.dart';

class ResetPasswordController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> resetPassword({
    required String email,
    required String otp,
    required String password,
    required VoidCallback clearTextFormField,
    required VoidCallback resetPasswordFailed,
    required VoidCallback resetPasswordSuccess,
    required VoidCallback onPressedResetPasswordButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response =
        await ResetPasswordViewViewModel.resetPasswordUser(
      requestData: {
        "email": email,
        "OTP": otp,
        "password": password,
      },
    );

    _inProgress = false;
    update();

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedResetPasswordButton();
      resetPasswordSuccess();
      debugPrint("Successfully Password Reset.");
    } else {
      _errorMessage =
          response.errorMessage ?? 'Failed to Reset Password! Try again.';
      debugPrint(_errorMessage);
      resetPasswordFailed();
    }

    return isSuccess;
  }
}
