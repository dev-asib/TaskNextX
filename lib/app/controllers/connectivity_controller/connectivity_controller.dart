import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_next_x/app/utils/helpers/internet_status_dialog_box.dart';

class ConnectivityController extends GetxController {
  late StreamSubscription _streamSubscription;
  RxBool isDeviceConnected = false.obs;
  RxBool isAlert = false.obs;

  void _checkConnectivity() {
    try {
      _streamSubscription = Connectivity().onConnectivityChanged.listen(
        (result) async {
          try {
            isDeviceConnected.value =
                await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected.value && !isAlert.value) {
              internetStatusDialogBox(_handleRetry);

              isAlert.value = true;
            } else if (isDeviceConnected.value) {
              isAlert.value = false;
            }
          } catch (e) {
            debugPrint("Error checking internet connection: $e");
          }
        },
      );
    } catch (e) {
      debugPrint("Error listening to connectivity changes: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkConnectivity();
    });
  }

  void _handleRetry() async {
    try {
      Get.back();
      isDeviceConnected.value = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected.value) {
        internetStatusDialogBox(_handleRetry);
      } else {
        isAlert.value = false;
      }
    } catch (e) {
      debugPrint("Error during retry internet connection check: $e");
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
