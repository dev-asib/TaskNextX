import 'package:flutter/material.dart';

class InProgressTaskListView extends StatefulWidget {
  const InProgressTaskListView({super.key});

  @override
  State<InProgressTaskListView> createState() => _InProgressTaskListViewState();
}

class _InProgressTaskListViewState extends State<InProgressTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In Progress Task List View"),
      ),
    );
  }
}
