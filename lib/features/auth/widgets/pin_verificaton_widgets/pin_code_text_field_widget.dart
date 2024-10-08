import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class PinCodeTextFormFieldWidget extends StatelessWidget {
  const PinCodeTextFormFieldWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController pinTEController,
  })  : _formKey = formKey,
        _pinTEController = pinTEController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _pinTEController;

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Form(
      key: _formKey,
      child: PinCodeTextField(
        autoDisposeControllers: false,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        textInputAction: TextInputAction.next,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: SizeConfig.screenHeight! * 0.0576,
          fieldWidth: SizeConfig.screenWidth! * 0.0972,
          activeFillColor: isLightTheme
              ? LightShadeAppColors.pinCodeFieldActiveFillColor
              : DarkShadeAppColors.pinCodeFieldActiveFillColor,
          selectedColor: isLightTheme
              ? LightShadeAppColors.pinCodeFieldSelectedColor
              : DarkShadeAppColors.pinCodeFieldSelectedColor,
          selectedFillColor: isLightTheme
              ? LightShadeAppColors.pinCodeFieldSelectedFillColor
              : DarkShadeAppColors.pinCodeFieldSelectedFillColor,
          inactiveFillColor: isLightTheme
              ? LightShadeAppColors.pinCodeFieldInactiveFillColor
              : DarkShadeAppColors.pinCodeFieldInactiveFillColor,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: isLightTheme
            ? LightShadeAppColors.pinCodeFieldBackgroundColor
            : DarkShadeAppColors.pinCodeFieldBackgroundColor,
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        controller: _pinTEController,
        appContext: context,
        validator: _otpValidation,
      ),
    );
  }

  String? _otpValidation(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "Please enter a valid 6 digit PIN";
    }
    return null;
  }
}
