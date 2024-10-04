import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/validators.dart';

class EmailTextFormFieldWidget extends StatelessWidget {
  const EmailTextFormFieldWidget({
    super.key,
    required this.emailTEController,
    this.validator,
  });

  final TextEditingController emailTEController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTEController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: _buildInputDecoration(),
      validator: validator ?? _emailValidation,
    );
  }

  String? _emailValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "Enter your email";
    }
    return Validators.validateEmail(value!);
  }

  InputDecoration _buildInputDecoration() {
    return const InputDecoration(
      labelText: "Email",
      hintText: "Email",
      prefixIcon: Icon(Icons.email_outlined),
    );
  }
}
