import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class AuthFooterWidget extends StatelessWidget {
  const AuthFooterWidget({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return RichText(
      text: TextSpan(
        style: textTheme.bodyLarge,
        text: promptText,
        children: [
          TextSpan(
            style: textTheme.bodyLarge?.copyWith(
              color: isLightTheme
                  ? LightShadeAppColors.themeColor
                  : DarkShadeAppColors.themeColor,
            ),
            text: actionText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
