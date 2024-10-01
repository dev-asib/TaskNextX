import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_footer_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_header_widget.dart';
import 'package:task_next_x/features/auth/widgets/email_text_form_field_widget.dart';
import 'package:task_next_x/features/auth/widgets/mobile_text_form_field_widget.dart';
import 'package:task_next_x/features/auth/widgets/name_text_form_field_widget.dart';
import 'package:task_next_x/features/auth/widgets/password_text_form_field_widget.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

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
                    const AuthHeaderWidget(title: "Join With Us"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    NameTextFormFieldWidget(
                        nameTEController: _firstNameTEController,
                        validator: (String? value) {},
                        labelText: "First name",
                        hintText: "First name"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    NameTextFormFieldWidget(
                        nameTEController: _lastNameTEController,
                        validator: (String? value) {},
                        labelText: "Last name",
                        hintText: "Last name"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    EmailTextFormFieldWidget(
                      emailTEController: _emailTEController,
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    MobileTextFormFieldWidget(
                      mobileTEController: _mobileTEController,
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    PasswordTextFormFieldWidget(
                      passwordTEController: _passwordTEController,
                      hintText: "Password",
                      labelText: "Password",
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _onTapSignUpButton();
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

  _onTapSignUpButton() {
    Get.toNamed(RoutesName.signInView);
  }

  _onTapSignInButton() {
    Get.toNamed(RoutesName.signInView);
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
