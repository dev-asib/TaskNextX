import 'package:flutter/material.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/features/tasks/widgets/profile_app_bar.dart';
import 'package:task_next_x/features/tasks/widgets/task_item_widget.dart';

class CancelledTaskListView extends StatefulWidget {
  const CancelledTaskListView({super.key});

  @override
  State<CancelledTaskListView> createState() => _CancelledTaskListViewState();
}

class _CancelledTaskListViewState extends State<CancelledTaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth! * 0.0389,
          right: SizeConfig.screenWidth! * 0.0389,
        ),
        child: Column(
          children: [
            _buildTaskItemList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItemList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
         // return const TaskItemWidget();
        },
      ),
    );
  }
}
