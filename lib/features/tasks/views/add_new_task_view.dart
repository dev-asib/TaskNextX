import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/add_new_task_controller.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/app/widgets/auth_header_widget.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/add_new_task_form_widget.dart';
import 'package:task_next_x/app/widgets/profile_app_bar.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({super.key});

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

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
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.0389),
                  const AuthHeaderWidget(title: "Add New Task"),
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  AddNewTaskFormWidget(
                    formKey: _formKey,
                    titleTEController: _titleTEController,
                    descriptionTEController: _descriptionTEController,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.02),
                  _buildTaskAddButton(),
                  SizedBox(height: SizeConfig.screenHeight! * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskAddButton() {
    return GetBuilder<AddNewTaskController>(builder: (addNewTaskController) {
      return Visibility(
        visible: !addNewTaskController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: ElevatedButton(
          onPressed: _onTapAddButton,
          child: const Text("Add"),
        ),
      );
    });
  }

  _onTapAddButton() async {
    if (_formKey.currentState!.validate()) {
      final bool isBrightness =
          Theme.of(context).brightness == Brightness.light;
      final AddNewTaskController addNewTaskController =
          Get.find<AddNewTaskController>();

      await addNewTaskController.addNewTask(
        title: _titleTEController.text.trim(),
        description: _descriptionTEController.text.trim(),
        clearTextFormField: _clearTextFormField,
        addToFailedTask: () => _addToFailedTask(
          addNewTaskController,
          isBrightness,
        ),
        addToSuccessTask: _addToSuccessTask,
        onPressedAddButton: _onPressedAddButton,
      );
    }
  }

  void _addToFailedTask(
      AddNewTaskController addNewTaskController, bool isBrightness) {
    AlertHelper.showFlushBarMessage(
      title: "Warning!",
      message: addNewTaskController.errorMessage.toString(),
      isError: true,
    );
  }

  void _addToSuccessTask() {
    AlertHelper.showFlushBarMessage(
      title: "Congratulations",
      message: "Successfully Added Task",
      isError: false,
    );
  }

  void _onPressedAddButton() {
    Get.toNamed(RoutesName.bottomNavMainView);
  }

  void _clearTextFormField() {
    _titleTEController.clear();
    _descriptionTEController.clear();
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
