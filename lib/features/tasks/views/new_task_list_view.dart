import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/features/tasks/widgets/profile_app_bar.dart';
import 'package:task_next_x/features/tasks/widgets/task_item_widget.dart';
import 'package:task_next_x/features/tasks/widgets/task_summary_card.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class NewTaskListView extends StatefulWidget {
  const NewTaskListView({super.key});

  @override
  State<NewTaskListView> createState() => _NewTaskListViewState();
}

class _NewTaskListViewState extends State<NewTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth! * 0.0389,
          right: SizeConfig.screenWidth! * 0.0389,
          top: SizeConfig.screenWidth! * 0.0389,
        ),
        child: Column(
          children: [
            _buildSummarySection(),
            _buildTaskItemList(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _onTapAddButton,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildTaskItemList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const TaskItemWidget();
        },
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            taskCount: "10",
            taskTitle: "New",
          ),
          TaskSummaryCard(
            taskCount: "4",
            taskTitle: "Completed",
          ),
          TaskSummaryCard(
            taskCount: "7",
            taskTitle: "In Progress",
          ),
          TaskSummaryCard(
            taskCount: "25",
            taskTitle: "Cancelled",
          ),
        ],
      ),
    );
  }

  void _onTapAddButton() {
    Get.toNamed(RoutesName.addNewTaskListView);
  }
}
