import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/bottom_nav_main_view_controller.dart';
import 'package:task_next_x/features/tasks/views/cancelled_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/completed_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/in_progress_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/new_task_list_view.dart';

class BottomNavMainView extends StatefulWidget {
  const BottomNavMainView({super.key});

  @override
  State<BottomNavMainView> createState() => _BottomNavMainViewState();
}

class _BottomNavMainViewState extends State<BottomNavMainView> {
  final List<Widget> _views = const [
    NewTaskListView(),
    CompletedTaskListView(),
    InProgressTaskListView(),
    CancelledTaskListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavMainViewController>(
        builder: (bottomNavMainViewController) {
      return Scaffold(
        body: _views[bottomNavMainViewController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavMainViewController.selectedIndex,
          onDestinationSelected: bottomNavMainViewController.changeIndex,
          //indicatorColor: Colors.green.shade100,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.task), label: "New"),
            NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
            NavigationDestination(
                icon: Icon(Icons.downloading), label: "In Progress"),
            NavigationDestination(
                icon: Icon(Icons.close_outlined), label: "Cancelled"),
          ],
        ),
      );
    });
  }
}
