import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task_next_x/app/models/entities/network_response.dart';
import 'package:task_next_x/app/models/user_auth_model/user_model.dart';
import 'package:task_next_x/app/utils/helpers/alert_helper.dart';
import 'package:task_next_x/data/local/auth_controller_services.dart';
import 'package:task_next_x/features/profile/view_models/update_profile_view_view_model.dart';

class UpdateProfileController extends GetxController {
  bool _inProgress = false;
  bool _imageInProgress = false;
  String? _errorMessage;
  XFile? _selectedImage;
  String? _imagePickerError;
  String _encodedPhoto = '';

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  XFile? get selectedImage => _selectedImage;

  String? get imagePickerError => _imagePickerError;

  bool get imageInProgress => _imageInProgress;

  String get encodedPhoto => _encodedPhoto;

  Future<bool> updateProfileUser({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    String password = '',
    required VoidCallback clearTextFormField,
    required VoidCallback profileUpdateFailed,
    required VoidCallback profileUpdateSuccess,
    required VoidCallback onPressedProfileUpdateButton,
  }) async {
    bool isSuccess = false;

    _inProgress = true;
    update();

    NetworkResponse response = await UpdateProfileViewViewModel.updateProfile(
      email: email,
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      password: password,
    );

    if (response.isSuccess && response.responseBody['status'] == 'success') {
      UserModel userModel = UserModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        password: password,
      );

      _errorMessage = null;
      isSuccess = true;
      clearTextFormField();
      onPressedProfileUpdateButton();
      await Get.find<AuthControllerServices>().saveUserData(userModel);
      profileUpdateSuccess();
      debugPrint("Profile Successfully updated.");
    } else {
      _errorMessage =
          response.errorMessage ?? 'Profile update failed! Try again.';
      debugPrint(_errorMessage);
      profileUpdateFailed();
    }

    _inProgress = false;
    update();

    return isSuccess;
  }

  Future<void> pickedImage() async {
    try {
      if (await _checkAndRequestStoragePermission()) {
        _imageInProgress = true;
        update();

        final imagePicker = ImagePicker();
        final XFile? result = await imagePicker.pickImage(
          source: ImageSource.gallery,
        );

        if (result != null) {
          _selectedImage = result;
          File file = File(_selectedImage!.path);
          _encodedPhoto = base64Encode(await file.readAsBytes());
          Get.find<AuthControllerServices>()
              .saveEncodedProfilePhoto(_encodedPhoto);
          _imagePickerError = null;
          debugPrint("Image selected: ${_selectedImage!.path}");
        } else {
          _imagePickerError = "You haven't selected any photo.";
          AlertHelper.showFlushBarMessage(
            title: "Photo Alert!",
            message: _imagePickerError!,
            isError: true,
          );
          debugPrint(_imagePickerError);
        }
      }
    } catch (e) {
      _imagePickerError = e.toString();
      AlertHelper.showFlushBarMessage(
        title: "Warning",
        message: "Something went wrong",
        isError: true,
      );
      debugPrint("Error picking image: $_imagePickerError");
    } finally {
      _imageInProgress = false;
      update();
    }
  }

  Future<bool> _checkAndRequestStoragePermission() async {
    var permissionStatus = await Permission.storage.status;
    if (!permissionStatus.isGranted) {
      permissionStatus = await Permission.storage.request();
    }

    if (permissionStatus.isGranted) {
      return true;
    } else {
      _imagePickerError = "Storage permission denied.";
      AlertHelper.showFlushBarMessage(
        title: "Permission Alert!",
        message: _imagePickerError!,
        isError: true,
      );
      debugPrint(_imagePickerError);
      return false;
    }
  }
}
