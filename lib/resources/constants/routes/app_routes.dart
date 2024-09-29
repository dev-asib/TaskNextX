import 'package:get/get.dart';
import 'package:task_next_x/features/auth/views/splash_view.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() {
    [
      /// Auth Routes
      _getPage(routeName: RoutesName.splashView),
      _getPage(routeName: RoutesName.signUpView),
      _getPage(routeName: RoutesName.signInView),
      _getPage(routeName: RoutesName.emailVerificationView),
      _getPage(routeName: RoutesName.otpVerificationView),
      _getPage(routeName: RoutesName.setPasswordView),

      /// Task Routes
      _getPage(routeName: RoutesName.newTaskListView),
      _getPage(routeName: RoutesName.completedTaskListView),
      _getPage(routeName: RoutesName.cancelledTaskListView),
      _getPage(routeName: RoutesName.inProgressTaskListView),
      _getPage(routeName: RoutesName.addNewTaskListView),

      /// Profile Routes
      _getPage(routeName: RoutesName.updateProfileView),
    ];
  }

  static GetPage<dynamic> _getPage({required String routeName}) {
    return GetPage(
      name: routeName,
      page: () => const SplashView(),
      transitionDuration: const Duration(seconds: 3),
      transition: Transition.leftToRightWithFade,
    );
  }
}
