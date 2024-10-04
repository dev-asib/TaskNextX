import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/email_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/password_text_form_field_widget.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTEController,
    required TextEditingController passwordTEController,
  })  : _formKey = formKey,
        _emailTEController = emailTEController,
        _passwordTEController = passwordTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTEController;
  final TextEditingController _passwordTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          EmailTextFormFieldWidget(
            emailTEController: _emailTEController,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          PasswordTextFormFieldWidget(
            passwordTEController: _passwordTEController,
            hintText: "Password",
            labelText: "Password",
          ),
        ],
      ),
    );
  }
}
