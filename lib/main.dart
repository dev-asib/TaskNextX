import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_next_x/app/app/app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  // runApp(const TaskNextX());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const TaskNextX(), // Wrap your app
    ),
  );
}
