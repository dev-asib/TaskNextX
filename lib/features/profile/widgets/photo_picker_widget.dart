import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_next_x/app/controllers/profile_controllers/update_profile_controller.dart';
import 'package:task_next_x/app/utils/responsive/size_config.dart';
import 'package:task_next_x/app/widgets/centered_progress_indicator.dart';
import 'package:task_next_x/resources/constants/app_colors/dark_shade_app_colors.dart';
import 'package:task_next_x/resources/constants/app_colors/light_shade_app_colors.dart';

class PhotoPickerWidget extends StatelessWidget {
  const PhotoPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return GetBuilder<UpdateProfileController>(
        builder: (updateProfileController) {
      if (updateProfileController.imageInProgress) {
        return const CenteredProgressIndicator();
      }

      return GestureDetector(
        onTap: updateProfileController.pickedImage,
        child: Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: isLightTheme
                ? LightShadeAppColors.whiteColor
                : DarkShadeAppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isLightTheme
                      ? LightShadeAppColors.themeColor.withOpacity(0.6)
                      : DarkShadeAppColors.themeColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.0389,
              ),
              Expanded(
                child: Text(
                  updateProfileController.selectedImage != null
                      ? updateProfileController.selectedImage!.path
                      : "No image selected",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isLightTheme
                            ? LightShadeAppColors.greenColor
                            : DarkShadeAppColors.greenColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
