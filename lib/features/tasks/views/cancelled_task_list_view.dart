import 'package:flutter/material.dart';

class CancelledTaskListView extends StatefulWidget {
  const CancelledTaskListView({super.key});

  @override
  State<CancelledTaskListView> createState() => _CancelledTaskListViewState();
}

class _CancelledTaskListViewState extends State<CancelledTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancelled Task List View"),
      ),
    );
  }
}
