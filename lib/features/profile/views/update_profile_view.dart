import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/email_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/mobile_text_form_field_widget.dart';
import 'package:task_next_x/features/auth/widgets/auth_header_widget.dart';
import 'package:task_next_x/app/widgets/name_text_form_field_widget.dart';
import 'package:task_next_x/app/widgets/password_text_form_field_widget.dart';
import 'package:task_next_x/features/profile/widgets/photo_picker_widget.dart';
import 'package:task_next_x/features/tasks/widgets/profile_app_bar.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isBrightness = Theme.of(context).brightness == Brightness.light;
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: isBrightness
            ? LightShadeAppColors.secondaryScaffoldBackgroundColor
            : DarkShadeAppColors.secondaryScaffoldBackgroundColor,
        appBar: profileAppBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth! * 0.06),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.screenHeight! * 0.0389),
                    const AuthHeaderWidget(title: "Update Profile"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    PhotoPickerWidget(onTap: () {}),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    NameTextFormFieldWidget(
                        nameTEController: _firstNameTEController,
                        validator: (String? value) {},
                        labelText: "First name",
                        hintText: "First name"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    NameTextFormFieldWidget(
                        nameTEController: _lastNameTEController,
                        validator: (String? value) {},
                        labelText: "Last name",
                        hintText: "Last name"),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    EmailTextFormFieldWidget(
                      emailTEController: _emailTEController,
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    MobileTextFormFieldWidget(
                      mobileTEController: _mobileTEController,
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.01),
                    PasswordTextFormFieldWidget(
                      passwordTEController: _passwordTEController,
                      hintText: "Password",
                      labelText: "Password",
                      validator: (String? value) {},
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          /// Handle Update Profile logic
                        }
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.04),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
