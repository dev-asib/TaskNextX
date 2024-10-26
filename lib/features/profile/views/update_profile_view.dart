import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/profile_controllers/update_profile_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/profile/widgets/photo_picker_widget.dart';
import 'package:task_next_x/features/profile/widgets/update_profile_view_widget.dart';
import 'package:task_next_x/app/widgets/profile_app_bar.dart';
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
  void initState() {
    super.initState();

    _firstNameTEController.text = Get.arguments['firstName'];
    _lastNameTEController.text = Get.arguments['lastName'];
    _emailTEController.text = Get.arguments['email'];
    _mobileTEController.text = Get.arguments['mobile'];
    _passwordTEController.text = Get.arguments['password'];
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.0389),
                  const AuthHeaderWidget(title: "Update Profile"),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  PhotoPickerWidget(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.01),
                  UpdateProfileViewWidget(
                    formKey: _formKey,
                    firstNameTEController: _firstNameTEController,
                    lastNameTEController: _lastNameTEController,
                    emailTEController: _emailTEController,
                    mobileTEController: _mobileTEController,
                    passwordTEController: _passwordTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _updateProfileButton(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _updateProfileButton() {
    return GetBuilder<UpdateProfileController>(
        builder: (updateProfileController) {
      return Visibility(
        visible: !updateProfileController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: () => _onTapProfileButton(updateProfileController),
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      );
    });
  }

  Future<void> _onTapProfileButton(
      UpdateProfileController updateProfileController) async {
    if (_formKey.currentState!.validate()) {
      await updateProfileController.updateProfileUser(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        mobile: _mobileTEController.text.trim(),
        password: _passwordTEController.text,
        clearTextFormField: _clearTextFormField,
        profileUpdateFailed: () =>
            _profileUpdateFailed(updateProfileController),
        profileUpdateSuccess: _profileUpdateSuccess,
        onPressedProfileUpdateButton: _onPressedProfileUpdateButton,
      );
    }
  }

  void _onPressedProfileUpdateButton() {
    Get.back();
    Get.find<AuthControllerServices>();
  }

  void _profileUpdateFailed(UpdateProfileController updateProfileController) {
    AlertHelper.showFlushBarMessage(
      title: "Profile update Alert!",
      message: updateProfileController.errorMessage.toString(),
      isError: true,
    );
  }

  void _profileUpdateSuccess() {
    AlertHelper.showFlushBarMessage(
      title: "Congratulations",
      message: "Profile update successfully.",
      isError: false,
    );
  }

  void _clearTextFormField() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _emailTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
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
