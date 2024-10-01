import 'package:flutter/material.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  const PasswordTextFormFieldWidget({
    super.key,
    required this.passwordTEController,
    required this.validator,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController passwordTEController;
  final String? Function(String?) validator;
  final String hintText;
  final String labelText;

  @override
  State<PasswordTextFormFieldWidget> createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState
    extends State<PasswordTextFormFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordTEController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.password),
        suffixIcon: IconButton(
          onPressed: () {
            _isPasswordVisible = !_isPasswordVisible;
            setState(() {});
          },
          icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: widget.validator,
    );
  }
}
