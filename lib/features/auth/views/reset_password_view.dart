import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_footer_widget.dart';
import 'package:task_next_x/app/widgets/password_text_form_field_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_header_widget.dart';
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
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.12),
                    const AuthHeaderWidget(
                      title: "Set Password",
                      subTitle:
                          "Minimum length of password should be more than 6 letters and combination of letters and numbers",
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    PasswordTextFormFieldWidget(
                      passwordTEController: _passwordTEController,
                      hintText: "Password",
                      labelText: "Password",
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    PasswordTextFormFieldWidget(
                      passwordTEController: _confirmPasswordTEController,
                      hintText: "Confirm password",
                      labelText: "Confirm password",
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _onTapConfirmButton();
                        }
                      },
                      child: const Text("Confirm"),
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

  _onTapConfirmButton() {
    Get.toNamed(RoutesName.signInView);
  }

  _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
