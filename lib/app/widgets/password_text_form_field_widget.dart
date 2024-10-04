import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/validators.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  const PasswordTextFormFieldWidget({
    super.key,
    required this.passwordTEController,
    this.validator,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController passwordTEController;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelText;

  @override
  State<PasswordTextFormFieldWidget> createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState
    extends State<PasswordTextFormFieldWidget> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordTEController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: !_isPasswordVisible,
      decoration: _buildInputDecoration(),
      validator: widget.validator ?? _passwordValidation,
    );
  }

  String? _passwordValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "Enter your password";
    }
    return Validators.validatePassword(value!);
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: widget.labelText,
      hintText: widget.hintText,
      prefixIcon: const Icon(Icons.password),
      suffixIcon: IconButton(
        onPressed: _togglePasswordVisibility,
        icon:
        Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
