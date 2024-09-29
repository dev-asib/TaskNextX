import 'package:flutter/material.dart';

class AddNewTaskView extends StatefulWidget {
  const AddNewTaskView({super.key});

  @override
  State<AddNewTaskView> createState() => _AddNewTaskViewState();
}

class _AddNewTaskViewState extends State<AddNewTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task View"),
      ),
    );
  }
}
