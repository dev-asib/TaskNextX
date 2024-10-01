import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_footer_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/email_text_form_field_widget.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.06),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.12),
                    const AuthHeaderWidget(
                      title: "Your Email Address",
                      subTitle:
                          "A 6 digit verification pin will send to your email address",
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    EmailTextFormFieldWidget(
                      emailTEController: _emailTEController,
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _onTapEmailVerificationButton();
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
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
      ),
    );
  }

  _onTapEmailVerificationButton() {
    Get.toNamed(RoutesName.pinVerificationView);
  }

  _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
