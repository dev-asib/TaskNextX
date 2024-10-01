import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/features/auth/views/email_verification_view.dart';
import 'package:task_next_x/features/auth/views/pin_verification_view.dart';
import 'package:task_next_x/features/auth/views/reset_password_view.dart';
import 'package:task_next_x/features/auth/views/sign_in_view.dart';
import 'package:task_next_x/features/auth/views/sign_up_view.dart';
import 'package:task_next_x/features/auth/views/splash_view.dart';
import 'package:task_next_x/features/not_found/views/not_found_view.dart';
import 'package:task_next_x/features/profile/views/update_profile_view.dart';
import 'package:task_next_x/features/tasks/views/add_new_task_view.dart';
import 'package:task_next_x/features/tasks/views/cancelled_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/completed_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/in_progress_task_list_view.dart';
import 'package:task_next_x/features/tasks/views/new_task_list_view.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes() {
    return [
      /// Auth Routes
      _getPage(routeName: RoutesName.splashView, page: const SplashView()),
      _getPage(routeName: RoutesName.signUpView, page: const SignUpView()),
      _getPage(routeName: RoutesName.signInView, page: const SignInView()),
      _getPage(routeName: RoutesName.emailVerificationView, page: const EmailVerificationView()),
      _getPage(routeName: RoutesName.pinVerificationView, page: const PinVerificationView()),
      _getPage(routeName: RoutesName.resetPasswordView, page: const ResetPasswordView()),

      /// Task Routes
      _getPage(routeName: RoutesName.newTaskListView, page: const NewTaskListView()),
      _getPage(routeName: RoutesName.completedTaskListView, page: const CompletedTaskListView()),
      _getPage(routeName: RoutesName.cancelledTaskListView, page: const CancelledTaskListView()),
      _getPage(routeName: RoutesName.inProgressTaskListView, page: const InProgressTaskListView()),
      _getPage(routeName: RoutesName.addNewTaskListView, page: const AddNewTaskView()),

      /// Profile Routes
      _getPage(routeName: RoutesName.updateProfileView, page: const UpdateProfileView()),

    ];
  }

  static GetPage<dynamic> _getPage(
      {required String routeName, required Widget page}) {
    return GetPage(
      name: routeName,
      page: () => page,
      transitionDuration: const Duration(seconds: 3),
      transition: Transition.leftToRightWithFade,
    );
  }

  /// Not Found / Unknown Routes
  static GetPage<dynamic> unknownRoute() {
    return GetPage(
      name: RoutesName.notFoundView,
      page: () => const NotFoundView(),
      transitionDuration: const Duration(seconds: 3),
      transition: Transition.leftToRightWithFade,
    );
  }
}
