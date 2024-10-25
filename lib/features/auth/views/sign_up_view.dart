import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_up_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/sign_up_widgets/sign_up_form.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  const AuthHeaderWidget(title: "Join With Us"),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  SignUpForm(
                    formKey: _formKey,
                    firstNameTEController: _firstNameTEController,
                    lastNameTEController: _lastNameTEController,
                    emailTEController: _emailTEController,
                    mobileTEController: _mobileTEController,
                    passwordTEController: _passwordTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildSignUpButton(),
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

  Widget _buildSignUpButton() {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Visibility(
        visible: !signUpController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: signUpController.inProgress ? null : _onTapSignUpButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      );
    });
  }

  _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;
      final SignUpController signUpController = Get.find<SignUpController>();

      await signUpController.signUpUser(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        mobile: _mobileTEController.text.trim(),
        password: _passwordTEController.text,
        clearTextFormField: _clearTextFormField,
        signUpFailed: () => _signUpFailed(signUpController, isBrightness),
        signUpSuccess: _signUpSuccess,
        onPressedSignUpButton: _onPressedSignUpButton,
      );
    }
  }

  void _onPressedSignUpButton() {
    Get.back();
  }

  void _signUpSuccess() {
    AlertHelper.showFlushBarMessage(
      title: "Congratulations",
      message: "Registration Successful",
      isError: false,
    );
  }

  void _signUpFailed(SignUpController signUpController, bool isBrightness) {
    AlertHelper.showFlushBarMessage(
      title: "Registration Alert!",
      message: signUpController.errorMessage.toString(),
      isError: true,
    );
  }

  void _clearTextFormField() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _emailTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  void _onTapSignInButton() {
    Get.back();
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
