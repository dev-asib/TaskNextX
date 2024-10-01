import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_footer_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/pin_code_text_field_widget.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class PinVerificationView extends StatefulWidget {
  const PinVerificationView({super.key});

  @override
  State<PinVerificationView> createState() => _PinVerificationViewState();
}

class _PinVerificationViewState extends State<PinVerificationView> {
  final TextEditingController _pinTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
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
                  PinCodeTextFieldWidget(pinTEController: _pinTEController),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  ElevatedButton(
                    onPressed: _onTapVerifyButton,
                    child: const Text("Verify"),
                  ),
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

  void _onTapVerifyButton() {
    Get.toNamed(RoutesName.resetPasswordView);
  }

  void _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }
}
