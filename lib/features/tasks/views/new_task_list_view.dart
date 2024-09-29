import 'package:flutter/material.dart';

class NewTaskListView extends StatefulWidget {
  const NewTaskListView({super.key});

  @override
  State<NewTaskListView> createState() => _NewTaskListViewState();
}

class _NewTaskListViewState extends State<NewTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task List View"),
      ),
    );
  }
}
