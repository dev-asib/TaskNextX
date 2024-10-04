class ValidationConstants {
  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static RegExp mobileRegExp = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W_]).{8,}$');
  static RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]+$');
}
