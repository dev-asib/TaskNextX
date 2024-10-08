import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/password_text_form_field_widget.dart';

class ResetPasswordFormWidget extends StatelessWidget {
  const ResetPasswordFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController passwordTEController,
    required TextEditingController confirmPasswordTEController,
  })  : _formKey = formKey,
        _passwordTEController = passwordTEController,
        _confirmPasswordTEController = confirmPasswordTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _passwordTEController;
  final TextEditingController _confirmPasswordTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          PasswordTextFormFieldWidget(
            passwordTEController: _passwordTEController,
            hintText: "Password",
            labelText: "Password",
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          PasswordTextFormFieldWidget(
            passwordTEController: _confirmPasswordTEController,
            hintText: "Confirm password",
            labelText: "Confirm password",
          ),
        ],
      ),
    );
  }
}
