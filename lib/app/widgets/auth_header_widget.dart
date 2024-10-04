import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.title,
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(title, style: textTheme.titleLarge),
        if (subTitle != null && subTitle!.isNotEmpty)
          Text(
            subTitle!,
            style: textTheme.titleMedium,
          )
      ],
    );
  }
}
