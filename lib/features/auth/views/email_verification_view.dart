import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/email_verification_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/email_verification_widgets/email_verification_form_widget.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final EmailVerificationController emailVerificationController =
      Get.find<EmailVerificationController>();

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
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.12),
                  const AuthHeaderWidget(
                    title: "Your Email Address",
                    subTitle:
                        "A 6 digit verification pin will send to your email address",
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  EmailVerificationFormWidget(
                    formKey: _formKey,
                    emailTEController: _emailTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildEmailVerificationButton(),
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

  Widget _buildEmailVerificationButton() {
    return GetBuilder<EmailVerificationController>(
        builder: (emailVerificationController) {
      return Visibility(
        visible: !emailVerificationController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: _onTapEmailVerificationButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      );
    });
  }

  Future<void> _onTapEmailVerificationButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;

      await emailVerificationController.recoverVerifyEmail(
        email: _emailTEController.text.trim(),
        clearTextFormField: _clearTextFormField,
        emailVerificationSuccess: _emailVerificationSuccess,
        emailVerificationFailed: () => _emailVerificationFailed(isBrightness),
        onPressedEmailVerificationButton: _onPressedEmailVerificationButton,
      );
    }
  }

  void _emailVerificationFailed(bool isBrightness) {
    AlertHelper.showFlushBarMessage(
      title: "Email Verification Alert!",
      message: emailVerificationController.errorMessage.toString(),
      isError: true,
    );
  }

  void _emailVerificationSuccess() {
    AlertHelper.showFlushBarMessage(
      title: "OTP",
      message: "We sent 6 digits OTP code to your email.",
      isError: false,
    );
  }

  void _onPressedEmailVerificationButton() {
    Get.toNamed(RoutesName.pinVerificationView);
  }

  void _clearTextFormField() {
    _emailTEController.clear();
  }

  void _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
