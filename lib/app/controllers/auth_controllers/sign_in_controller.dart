import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/user_auth_model/log_in_model.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/auth/view_models/sign_in_view_view_model.dart';

class SignInController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> signInUser({
    required String email,
    required String password,
    required VoidCallback clearTextFormField,
    required VoidCallback signInFailed,
    required VoidCallback signInSuccess,
    required VoidCallback onPressedSignInButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response = await SignInViewViewModel.signIn(
      email: email,
      password: password,
    );

    _inProgress = false;
    update();

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      LoginModel loginModel = LoginModel.fromJson(response.responseBody);

      final AuthControllerServices authControllerServices =
          Get.find<AuthControllerServices>();
     await authControllerServices.saveUserAccessToken(loginModel.token!);
     await authControllerServices.saveUserData(loginModel.userModel!);

      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedSignInButton();
      signInSuccess();
      debugPrint("Sign In Successful.");
    } else {
      _errorMessage = response.errorMessage ?? 'Sign in failed! Try again.';
      debugPrint(_errorMessage);
      signInFailed();
    }

    return isSuccess;
  }
}
