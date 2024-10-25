import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/sign_in_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/sign_in_widget/sign_in_form_widget.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
                  const AuthHeaderWidget(title: "Get Started With"),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  SignInFormWidget(
                    formKey: _formKey,
                    emailTEController: _emailTEController,
                    passwordTEController: _passwordTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildSignInButton(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.04),
                  _signInFooter(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return GetBuilder<SignInController>(builder: (signInController) {
      return Visibility(
        visible: !signInController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: signInController.inProgress ? null : _onTapSignInButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      );
    });
  }

  Widget _signInFooter(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: _onTapForgotPasswordButton,
          child: const Text("Forgot Password?"),
        ),
        AuthFooterWidget(
          promptText: 'Don\' have an account?\t',
          actionText: 'Sign Up',
          onTap: _onTapSignUpButton,
        ),
      ],
    );
  }

  _onTapSignUpButton() {
    Get.toNamed(RoutesName.signUpView);
  }

  _onTapForgotPasswordButton() {
    Get.toNamed(RoutesName.emailVerificationView);
  }

  _onTapSignInButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;
      final SignInController signInController = Get.find<SignInController>();

      await signInController.signInUser(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        clearTextFormField: _clearTextFormField,
        signInSuccess: _signUpSuccess,
        signInFailed: () => _signUpFailed(signInController, isBrightness),
        onPressedSignInButton: _onPressedSignInButton,
      );
    }
  }

  void _signUpFailed(SignInController signInController, bool isBrightness) {
    AlertHelper.showFlushBarMessage(
      title: "Sign In Alert!",
      message: signInController.errorMessage.toString(),
      isError: true,
    );
  }

  void _signUpSuccess() {
    AlertHelper.showFlushBarMessage(
        title: "Congratulations", message: "Login Successful", isError: false);
  }

  void _onPressedSignInButton() {
    Get.toNamed(RoutesName.bottomNavMainView);
  }

  void _clearTextFormField() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
