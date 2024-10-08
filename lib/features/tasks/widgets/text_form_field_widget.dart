import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textTEController,
    required this.hintText,
    required this.maxLines,
    this.validator,
  });

  final TextEditingController textTEController;
  final String? Function(String?)? validator;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textTEController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(hintText: hintText),
      validator: validator ?? _textFieldValidation,
    );
  }

  String? _textFieldValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "You have to write some text";
    }
    return null;
  }
}
