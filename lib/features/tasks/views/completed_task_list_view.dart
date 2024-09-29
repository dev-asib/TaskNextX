import 'package:flutter/material.dart';

class CompletedTaskListView extends StatefulWidget {
  const CompletedTaskListView({super.key});

  @override
  State<CompletedTaskListView> createState() => _CompletedTaskListViewState();
}

class _CompletedTaskListViewState extends State<CompletedTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Task List View"),
      ),
    );
  }
}
