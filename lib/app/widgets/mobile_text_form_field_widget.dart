import 'package:flutter/material.dart';

class MobileTextFormFieldWidget extends StatelessWidget {
  const MobileTextFormFieldWidget({
    super.key,
    required this.mobileTEController,
    required this.validator,
  });

  final TextEditingController mobileTEController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mobileTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: "Mobile",
        hintText: "Mobile",
        prefixIcon: Icon(Icons.phone),
      ),
      validator: validator,
    );
  }
}
