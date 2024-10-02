import 'package:flutter/material.dart';

class NameTextFormFieldWidget extends StatelessWidget {
  const NameTextFormFieldWidget({
    super.key,
    required this.nameTEController,
    required this.validator,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController nameTEController;
  final String? Function(String?) validator;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameTEController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: const Icon(Icons.person_outline),
      ),
      validator: validator,
    );
  }
}
