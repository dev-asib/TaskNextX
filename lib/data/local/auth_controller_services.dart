import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_next_x/app/models/sign_In/user_model.dart';

class AuthControllerServices {
  static const _accessToken = 'access_token';
  static const _userDataKey = 'user_data';
  static const _verificationEmailKey = 'user_data';
  static const _verifyOtpKey = 'user_data';

  static String accessToken = '';
  static UserModel? userData;
  static String verificationEmail = '';
  static String verifyOtp = '';

  static Future<void> saveUserAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessToken, token);
    accessToken = token;
  }

  static Future<String?> getUserAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessToken);
  }

  static Future<void> saveUserData(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(user.toJson()));
    userData = user;
  }

  static Future<UserModel?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(_userDataKey);

    if (data == null) return null;

    UserModel userModel = UserModel.fromJson(jsonDecode(data));
    return userModel;
  }

  static Future<void> saveVerificationEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_verificationEmailKey, email);
    verificationEmail = email;
  }

  static Future<void> getVerificationEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(_verificationEmailKey);
  }

  static Future<void> saveVerifyOtp(String otp) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_verifyOtpKey, otp);
    verifyOtp = otp;
  }

  static Future<void> getVerifyOtp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(_verifyOtpKey);
  }

  static Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static Future<bool> checkAuthState() async {
    String? token = await getUserAccessToken();

    if (token == null) return false;

    accessToken = token;
    userData = await getUserData();
    return true;
  }
}
