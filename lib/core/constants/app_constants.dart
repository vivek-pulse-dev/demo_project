class AppConstants {
  AppConstants._internal();

  static final AppConstants _instance = AppConstants._internal();

  static AppConstants get instance => _instance;

  // App General
  static const String appName = 'User Management App';
  static const String splashTitle = 'User Management';
  static const int defaultPageSize = 10;

}