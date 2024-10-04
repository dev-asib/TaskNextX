import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class PinCodeTextFieldWidget extends StatelessWidget {
  const PinCodeTextFieldWidget({
    super.key,
    required this.pinTEController,
  });

  final TextEditingController pinTEController;

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return PinCodeTextField(
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
      controller: pinTEController,
      appContext: context,
    );
  }
}
