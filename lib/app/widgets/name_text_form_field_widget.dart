import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/validators.dart';

class NameTextFormFieldWidget extends StatelessWidget {
  const NameTextFormFieldWidget({
    super.key,
    required this.nameTEController,
    this.validator,
    required this.labelText,
    required this.hintText,
    required this.emptyErrorMessage,
    required this.nameRegExpErrorMessage,
  });

  final TextEditingController nameTEController;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final String emptyErrorMessage;
  final String nameRegExpErrorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameTEController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: _buildInputDecoration(),
      validator: validator ?? _nameValidation,
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: const Icon(Icons.person_outline),
    );
  }

  String? _nameValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return emptyErrorMessage;
    }
    return Validators.validateName(
      value!,
      nameRegExpErrorMessage,
    );
  }
}
