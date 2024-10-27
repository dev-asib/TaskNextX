import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/completed_task_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/empty_task_widget.dart';
import 'package:task_next_x/app/widgets/profile_app_bar.dart';
import 'package:task_next_x/features/tasks/widgets/task_item_widget.dart';

class CompletedTaskListView extends StatefulWidget {
  const CompletedTaskListView({super.key});

  @override
  State<CompletedTaskListView> createState() => _CompletedTaskListViewState();
}

class _CompletedTaskListViewState extends State<CompletedTaskListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _initialCall();
    });
  }

  void _initialCall() {
    Get.find<CompletedTaskController>().getCompletedTaskList();
  }

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
      child: RefreshIndicator(
        onRefresh: () async {
          initState();
        },
        child: GetBuilder<CompletedTaskController>(
            builder: (completedTaskController) {
          if (!completedTaskController.inProgress) {
            return const CenteredProgressIndicator();
          }
          return Visibility(
            visible: completedTaskController.completedTaskList.isEmpty == false,
            replacement: const EmptyTaskWidget(title: "Completed task not found.",),
            child: ListView.builder(
              itemCount: completedTaskController.completedTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemWidget(
                  taskModel: completedTaskController.completedTaskList[index],
                  onUpdate: _initialCall,
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
