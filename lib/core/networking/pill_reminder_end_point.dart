abstract class PillReminderEndPoint {
  // change the base url to your local ip with port
  static const String baseUrl = 'http://10.0.2.2:8000/';
  static const String registerClient = 'auth/register/client';
  static const String loginClient = 'auth/login/mobile';
  static const String logoutClient = 'auth/logout';
  static const String forgotPassword = 'auth/password/forgot_password';
  static const String changePassword = 'auth/password/change_password';
  static const String updateProfile = 'auth/profile';
  static const String getProfile = 'auth/profile';
  static const String verifyUser = 'auth/verify_user';
  static const String resendCode = 'auth/verify_user/resend';
  static const String verifyCode = 'auth/verify_code';
  static const String removeAccount = 'auth/remove_account';
  static const String getNotifications = 'notifications';
  static const String getUnreadNotificationsCount =
      'notifications/unread_notifications_count';
  static const String markAllNotificationsAsRead = 'notifications';
  static String markOneNotificationAsRead(String id) => 'notifications/$id';
  static const String deleteNotification = 'notifications';
  static String deleteOneNotificationAsRead(String id) => 'notifications/$id';
  static const String getMedicines = 'api/medicines';
  static String getOneMedicine(String id) => 'api/medicines/$id';
  static const String storeMedicine = 'api/medicines';
  static String updateMedicine(String id) => 'api/medicines/$id';
  static String deleteMedicine(String id) => 'api/medicines/$id';
  static String takeMedicine(String id) => 'api/medicines/$id/take';
  static String snozeMedicine(String id) => 'api/medicines/$id/snooze';
}
