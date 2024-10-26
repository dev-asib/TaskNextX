import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_next_x/app/models/user_auth_model/user_model.dart';

class AuthControllerServices extends GetxController {
  final String _accessTokenKey = 'access_token';
  final String _userDataKey = 'user_data';
  final String _verificationEmailKey = 'verification_email';
  final String _verifyOtpKey = 'verify_otp';
  final String _profilePhotoKey = 'profile_image';

  String _accessToken = '';
  UserModel? _userData;
  String _verificationEmail = '';
  String _verifyOtp = '';
  String _encodedProfilePhoto = '';

  String get accessToken => _accessToken;

  UserModel? get userData => _userData;

  String get verificationEmail => _verificationEmail;

  String get verifyOtp => _verifyOtp;

  String get encodedProfilePhoto => _encodedProfilePhoto;

  Future<void> saveUserAccessToken(String token) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString(_accessTokenKey, token);
      _accessToken = token;
      update();
    } catch (e) {
      debugPrint("Error saving access token: $e");
    }
  }

  Future<void> getUserAccessToken() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      _accessToken = sharedPreferences.getString(_accessTokenKey) ?? '';
      update();
    } catch (e) {
      debugPrint("Error receiving access token: $e");
    }
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          _userDataKey, jsonEncode(user.toJson()));
      _userData = user;
      update();
    } catch (e) {
      debugPrint("Error saving user data: $e");
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      String? data = sharedPreferences.getString(_userDataKey);

      if (data == null) return null;

      _userData = UserModel.fromJson(jsonDecode(data));
      update();
      return _userData;
    } catch (e) {
      debugPrint("Error receiving user data: $e");
      return null;
    }
  }

  Future<void> saveVerificationEmail(String email) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString(_verificationEmailKey, email);
      _verificationEmail = email;
      update();
    } catch (e) {
      debugPrint("Error saving verification email: $e");
    }
  }

  Future<void> getVerificationEmail() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      _verificationEmail =
          sharedPreferences.getString(_verificationEmailKey) ?? '';
      update();
    } catch (e) {
      debugPrint("Error receiving verification email: $e");
    }
  }

  Future<void> saveVerifyOtp(String otp) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString(_verifyOtpKey, otp);
      _verifyOtp = otp;
      update();
    } catch (e) {
      debugPrint("Error saving verification otp: $e");
    }
  }

  Future<void> getVerifyOtp() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      _verifyOtp = sharedPreferences.getString(_verifyOtpKey) ?? '';
      update();
    } catch (e) {
      debugPrint("Error receiving verification otp: $e");
    }
  }

  Future<void> saveEncodedProfilePhoto(String encodedPhoto) async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString(_profilePhotoKey, encodedPhoto);
      _encodedProfilePhoto = encodedPhoto;
      update();
    } catch (e) {
      debugPrint("Error saving encoded profile photo: $e");
    }
  }

  Future<void> getProfilePhoto() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      _encodedProfilePhoto = sharedPreferences.getString(_profilePhotoKey) ?? '';
      update();
    } catch (e) {
      debugPrint("Error receiving profile photo: $e");
    }
  }

  Future<void> clearAllData() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      _accessToken = '';
      _userData = null;
      _verificationEmail = '';
      _verifyOtp = '';
      _encodedProfilePhoto = '';
      update();
    } catch (e) {
      debugPrint("Error clearing all data: $e");
    }
  }

  Future<bool> checkAuthState() async {
    await getUserAccessToken();

    if (_accessToken.isEmpty) {
      update();
      return false;
    }

    _userData = await getUserData();

    update();
    return true;
  }

  void onUserRefresh() {
    update();
  }
}
