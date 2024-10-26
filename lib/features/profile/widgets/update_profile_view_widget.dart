import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/email_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/mobile_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/name_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/password_text_form_field_widget.dart';

class UpdateProfileViewWidget extends StatelessWidget {
  const UpdateProfileViewWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameTEController,
    required TextEditingController lastNameTEController,
    required TextEditingController emailTEController,
    required TextEditingController mobileTEController,
    required TextEditingController passwordTEController,
  })  : _formKey = formKey,
        _firstNameTEController = firstNameTEController,
        _lastNameTEController = lastNameTEController,
        _emailTEController = emailTEController,
        _mobileTEController = mobileTEController,
        _passwordTEController = passwordTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _firstNameTEController;
  final TextEditingController _lastNameTEController;
  final TextEditingController _emailTEController;
  final TextEditingController _mobileTEController;
  final TextEditingController _passwordTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          NameTextFormFieldWidget(
              nameTEController: _firstNameTEController,
              labelText: "First name",
              hintText: "First name",
              emptyErrorMessage: "Enter your first name",
              nameRegExpErrorMessage:
                  "First name must start with a capital letter and contain only letters."),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          NameTextFormFieldWidget(
            nameTEController: _lastNameTEController,
            labelText: "Last name",
            hintText: "Last name",
            emptyErrorMessage: "Enter your last name",
            nameRegExpErrorMessage:
                "Last name must start with a capital letter and contain only letters.",
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          EmailTextFormFieldWidget(
            emailTEController: _emailTEController,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          MobileTextFormFieldWidget(
            mobileTEController: _mobileTEController,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          PasswordTextFormFieldWidget(
            passwordTEController: _passwordTEController,
            hintText: "Password (Optional)",
            labelText: "Password (Optional)",
            validator: _passwordValidator,
          ),
        ],
      ),
    );
  }

  String? _passwordValidator(String? value) {
    if (value?.isNotEmpty ?? true) {
      if (value!.length > 8) {
        return "Password shouldn't be less than 8 characters.";
      }
    }
    return null;
  }
}
