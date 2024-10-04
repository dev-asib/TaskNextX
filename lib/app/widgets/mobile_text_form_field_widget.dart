import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/validators.dart';

class MobileTextFormFieldWidget extends StatelessWidget {
  const MobileTextFormFieldWidget({
    super.key,
    required this.mobileTEController,
    this.validator,
  });

  final TextEditingController mobileTEController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mobileTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: _buildInputDecoration(),
      validator: validator ?? _mobileValidation,
    );
  }

  String? _mobileValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "Enter your mobile number";
    }
    return Validators.validateMobile(value!);
  }

  InputDecoration _buildInputDecoration() {
    return const InputDecoration(
      labelText: "Mobile",
      hintText: "Mobile",
      prefixIcon: Icon(Icons.phone),
    );
  }
}
