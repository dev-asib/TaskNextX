import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/cancelled_task_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/empty_task_widget.dart';
import 'package:task_next_x/features/tasks/widgets/profile_app_bar.dart';
import 'package:task_next_x/features/tasks/widgets/task_item_widget.dart';

class CancelledTaskListView extends StatefulWidget {
  const CancelledTaskListView({super.key});

  @override
  State<CancelledTaskListView> createState() => _CancelledTaskListViewState();
}

class _CancelledTaskListViewState extends State<CancelledTaskListView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialCall();
    });
  }

  void _initialCall() {
    Get.find<CancelledTaskController>().getCancelledTaskList();
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
        child: GetBuilder<CancelledTaskController>(
            builder: (cancelledTaskController) {
              if (cancelledTaskController.inProgress) {
                return const CenteredProgressIndicator();
              }
              return Visibility(
                visible:
                cancelledTaskController.cancelledTaskList.isEmpty == false,
                replacement: const EmptyTaskWidget(
                  title: "Cancelled task not found.",
                ),
                child: ListView.builder(
                  itemCount: cancelledTaskController.cancelledTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskItemWidget(
                      taskModel: cancelledTaskController.cancelledTaskList[index],
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
