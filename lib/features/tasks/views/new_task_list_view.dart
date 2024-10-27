import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/new_task_controller.dart';
import 'package:task_next_x/app/controllers/tasks_controllers/task_count_by_status_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/features/tasks/widgets/empty_task_widget.dart';
import 'package:task_next_x/app/widgets/profile_app_bar.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _initialCall();
    });
  }

  void _initialCall() {
    Get.find<NewTaskController>().getNewTaskList();
    Get.find<TaskCountByStatusController>().getTaskCountByStatus();
  }

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
      child: RefreshIndicator(
        onRefresh: () async {
          _initialCall();
        },
        child: GetBuilder<NewTaskController>(builder: (newTaskController) {
          if (!newTaskController.inProgress) {
            return const CenteredProgressIndicator();
          }
          return Visibility(
            visible: newTaskController.newTaskList.isEmpty == false,
            replacement: const EmptyTaskWidget(title: "New task not found.",),
            child: ListView.builder(
              itemCount: newTaskController.newTaskList.length,
              itemBuilder: (context, index) {
                return TaskItemWidget(
                  taskModel: newTaskController.newTaskList[index],
                  onUpdate: _initialCall,
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSummarySection() {
    return GetBuilder<TaskCountByStatusController>(
        builder: (taskCountByStatusController) {
      return Visibility(
        visible: taskCountByStatusController.inProgress,
        replacement: const CenteredProgressIndicator(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: taskCountByStatusController.taskCountByStatusList.map((e) {
              return TaskSummaryCard(
                taskTitle: (e.sId ?? "Unknown").toUpperCase(),
                taskCount: (e.sum.toString()),
              );
            }).toList(),
          ),
        ),
      );
    });
  }

  void _onTapAddButton() {
    Get.toNamed(RoutesName.addNewTaskListView);
  }
}
