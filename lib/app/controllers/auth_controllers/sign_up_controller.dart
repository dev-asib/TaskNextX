import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/features/auth/view_models/sign_up_view_view_model.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String password,
    required VoidCallback clearTextFormField,
    required VoidCallback signUpFailed,
    required VoidCallback signUpSuccess,
    required VoidCallback onPressedSignUpButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response = await SignUpViewViewModel.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      mobile: mobile,
      password: password,
    );

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedSignUpButton();
      signUpSuccess();
      debugPrint("Registration Successful.");
    } else {
      _errorMessage =
          response.errorMessage ?? 'Registration failed! Try again.';
      debugPrint(_errorMessage);
      signUpFailed();
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
