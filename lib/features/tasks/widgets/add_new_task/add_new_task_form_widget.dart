import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/features/tasks/widgets/text_form_field_widget.dart';

class AddNewTaskFormWidget extends StatelessWidget {
  const AddNewTaskFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController titleTEController,
    required TextEditingController descriptionTEController,
  })  : _formKey = formKey,
        _titleTEController = titleTEController,
        _descriptionTEController = descriptionTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleTEController;
  final TextEditingController _descriptionTEController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormFieldWidget(
            textTEController: _titleTEController,
            hintText: "Subject",
            maxLines: 1,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          TextFormFieldWidget(
            textTEController: _descriptionTEController,
            hintText: "Description",
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
