class ApiUrls {
  static const String _baseUrl = 'http://152.42.163.176:2006/api/v1';

  static const String registration = '$_baseUrl/Registration';
  static const String logIn = '$_baseUrl/Login';
  static const String createTask = '$_baseUrl/createTask';
  static const String newTasks = '$_baseUrl/listTaskByStatus/New';
  static const String completedTasks = '$_baseUrl/listTaskByStatus/Completed';
  static const String inProgressTasks = '$_baseUrl/listTaskByStatus/Progress';
  static const String cancelledTasks = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';

  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  static String updateTasksStatus(String taskID, String taskStatus) =>
      '$_baseUrl/updateTaskStatus/$taskID/$taskStatus';
  static const String profileUpdate = '$_baseUrl/ProfileUpdate';

  static String recoverVerifyEmail(String email) =>
      '$_baseUrl/RecoverVerifyEmail/$email';

  static String otpVerification(String email, String otp) =>
      '$_baseUrl/RecoverVerifyOtp/$email/$otp';
  static const String recoverResetPass = '$_baseUrl/RecoverResetPassword';
}
