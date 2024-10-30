import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/reset_password_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/auth/widgets/reset_pass_word_widgets/reset_password_form_widget.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ResetPasswordController _resetPasswordController =
      Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: isBrightness
            ? LightShadeAppColors.secondaryScaffoldBackgroundColor
            : DarkShadeAppColors.secondaryScaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.12),
                  const AuthHeaderWidget(
                    title: "Set Your Password",
                    subTitle:
                        "The password must be at least 8 characters long and include letters, numbers and special characters",
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  ResetPasswordFormWidget(
                    formKey: _formKey,
                    passwordTEController: _passwordTEController,
                    confirmPasswordTEController: _confirmPasswordTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildConfirmButton(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.04),
                  AuthFooterWidget(
                    promptText: 'Have an account?\t',
                    actionText: 'Sign In',
                    onTap: _onTapSignInButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return GetBuilder<ResetPasswordController>(
        builder: (resetPasswordController) {
      return Visibility(
        visible: !resetPasswordController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: _onTapConfirmButton,
          child: const Text("Confirm"),
        ),
      );
    });
  }

  _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }

  Future<void> _onTapConfirmButton() async {
    if (_formKey.currentState!.validate() &&
        (_passwordTEController.text == _confirmPasswordTEController.text)) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;

      final AuthControllerServices authControllerServices =
          Get.find<AuthControllerServices>();

      await _resetPasswordController.resetPassword(
        email: authControllerServices.verificationEmail,
        otp: authControllerServices.verifyOtp,
        password: _passwordTEController.text,
        clearTextFormField: _clearTextFormField,
        resetPasswordSuccess: _resetPasswordSuccess,
        resetPasswordFailed: () => _resetPasswordFailed(isBrightness),
        onPressedResetPasswordButton: _onPressedResetPasswordButton,
      );
    }
  }

  void _onPressedResetPasswordButton() {
    Get.toNamed(RoutesName.signInView);
  }

  void _resetPasswordFailed(bool isBrightness) {
    AlertHelper.showFlushBarMessage(
      title: "Reset Password Alert",
      message: _resetPasswordController.errorMessage.toString(),
      isError: true,
    );
  }

  void _resetPasswordSuccess() {
    AlertHelper.showFlushBarMessage(
      title: "Congratulations",
      message: "successfully password change",
      isError: false,
    );
  }

  void _clearTextFormField() {
    _passwordTEController.clear();
    _confirmPasswordTEController.clear();
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
