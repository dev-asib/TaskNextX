import 'package:flutter/material.dart';
import 'package:task_next_x/app/widgets/email_text_form_field_widget.dart';

class EmailVerificationFormWidget extends StatelessWidget {
  const EmailVerificationFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTEController,
  })  : _formKey = formKey,
        _emailTEController = emailTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: EmailTextFormFieldWidget(emailTEController: _emailTEController),
    );
  }
}
