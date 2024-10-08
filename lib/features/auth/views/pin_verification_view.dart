import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/auth_controllers/pin_verification_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/auth/widgets/pin_verificaton_widgets/pin_code_text_field_widget.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class PinVerificationView extends StatefulWidget {
  const PinVerificationView({super.key});

  @override
  State<PinVerificationView> createState() => _PinVerificationViewState();
}

class _PinVerificationViewState extends State<PinVerificationView> {
  final TextEditingController _pinTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final PinVerificationController pinVerificationController =
      Get.find<PinVerificationController>();

  @override
  void initState() {
    super.initState();
  }

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
                    title: "Pin Verification",
                    subTitle:
                        "A 6 digit verification pin will send to your email address",
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  PinCodeTextFormFieldWidget(
                    pinTEController: _pinTEController,
                    formKey: _formKey,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildOnTapVerifyButton(),
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

  Widget _buildOnTapVerifyButton() {
    return GetBuilder<PinVerificationController>(
        builder: (pinVerificationController) {
      return Visibility(
        visible: !pinVerificationController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: _onTapVerifyButton,
          child: const Text("Verify"),
        ),
      );
    });
  }

  void _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }

  Future<void> _onTapVerifyButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;

      await pinVerificationController.recoverVerifyOTP(
        email: AuthControllerServices.verificationEmail,
        otp: _pinTEController.text,
        clearTextFormField: _clearTextFormField,
        otpVerificationSuccess: _otpVerificationSuccess,
        otpVerificationFailed: () => _otpVerificationFailed(isBrightness),
        onPressedOtpVerificationButton: _onPressedOtpVerificationButton,
      );
    }
  }

  void _otpVerificationFailed(bool isBrightness) {
    if (mounted) {
      AlertHelper.showFlushBarMessage(
        context: context,
        title: "OTP Verification Alert",
        message: pinVerificationController.errorMessage.toString(),
        backgroundColor: isBrightness
            ? LightShadeAppColors.redColor
            : DarkShadeAppColors.redColor,
      );
    }
  }

  void _otpVerificationSuccess() {
    if (mounted) {
      AlertHelper.showFlushBarMessage(
        context: context,
        title: "Congratulations",
        message: "successfully OTP verified",
      );
    }
  }

  void _onPressedOtpVerificationButton() {
    Get.toNamed(RoutesName.resetPasswordView);
  }

  void _clearTextFormField() {
    _pinTEController.clear();
  }
}
