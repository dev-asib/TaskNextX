import 'package:flutter/material.dart';

class SetPasswordView extends StatefulWidget {
  const SetPasswordView({super.key});

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Password View"),
      ),
    );
  }
}
