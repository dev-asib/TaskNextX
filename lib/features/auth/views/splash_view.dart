import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Future<void> _moveToNextView() async {
    bool isLoggedIn = await Get.find<AuthControllerServices>().checkAuthState();

    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(
        isLoggedIn ? RoutesName.bottomNavMainView : RoutesName.signInView,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _moveToNextView();
    Get.find<AuthControllerServices>().getProfilePhoto();
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
