import 'package:task_next_x/resources/constants/validation_constants.dart';

class Validators {
  static String? validateEmail(String email) {
    if (!ValidationConstants.emailRegExp.hasMatch(email)) {
      return "Invalid email format.";
    }
    return null;
  }

  static String? validateMobile(String mobile) {
    if (!ValidationConstants.mobileRegExp.hasMatch(mobile)) {
      return "Invalid mobile number.";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (!ValidationConstants.passwordRegExp.hasMatch(password)) {
      return "Password must be 8 characters long and include letters, numbers, and special characters.";
    }
    return null;
  }

  static String? validateName(String name, String nameRegExpErrorMessage) {
    if (!ValidationConstants.nameRegExp.hasMatch(name)) {
      return nameRegExpErrorMessage;
    }
    return null;
  }
}
