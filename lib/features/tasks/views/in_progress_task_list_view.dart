import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/inprogress_task_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/empty_task_widget.dart';
import 'package:task_next_x/app/widgets/profile_app_bar.dart';
import 'package:task_next_x/features/tasks/widgets/task_item_widget.dart';

class InProgressTaskListView extends StatefulWidget {
  const InProgressTaskListView({super.key});

  @override
  State<InProgressTaskListView> createState() => _InProgressTaskListViewState();
}

class _InProgressTaskListViewState extends State<InProgressTaskListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialCall();
    });
  }

  void _initialCall() {
    Get.find<InProgressTaskController>().getInProgressTaskList();
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
        child: GetBuilder<InProgressTaskController>(
            builder: (inProgressTaskController) {
          if (!inProgressTaskController.inProgress) {
            return const CenteredProgressIndicator();
          }
          return Visibility(
            visible:
                inProgressTaskController.inProgressTaskList.isEmpty == false,
            replacement: const EmptyTaskWidget(
              title: "In Progress task not found.",
            ),
            child: ListView.builder(
              itemCount: inProgressTaskController.inProgressTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemWidget(
                  taskModel: inProgressTaskController.inProgressTaskList[index],
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
