import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_next_x/app/controllers/connectivity_controllers/connectivity_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/background_widget.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/resources/constants/assets_paths.dart';
import 'package:get/get.dart';
import 'package:task_next_x/resources/constants/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();

  Future<void> _moveToNextView() async {
    while (!_connectivityController.isDeviceConnected.value) {
      await Future.delayed(const Duration(seconds: 1));
    }

    try {
      bool isLoggedIn =
          await Get.find<AuthControllerServices>().checkAuthState();

      Future.delayed(
        const Duration(seconds: 3),
        () => Get.offAllNamed(
          isLoggedIn ? RoutesName.bottomNavMainView : RoutesName.signInView,
        ),
      );
    } catch (e) {
      debugPrint("Error during navigation: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToNextView();
      Get.find<AuthControllerServices>().getProfilePhoto();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: _buildAppLogo(),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return SvgPicture.asset(
      AssetsPaths.taskNextXSvg,
      width: SizeConfig.screenWidth! * 0.43,
    );
  }
}
