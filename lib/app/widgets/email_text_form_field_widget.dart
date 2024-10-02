import 'package:flutter/material.dart';

class EmailTextFormFieldWidget extends StatelessWidget {
  const EmailTextFormFieldWidget({
    super.key,
    required this.emailTEController,
    required this.validator,
  });

  final TextEditingController emailTEController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailTEController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Email",
        prefixIcon: Icon(Icons.email_outlined),
      ),
      validator: validator,
    );
  }
}
