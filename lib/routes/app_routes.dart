import 'package:get/get.dart';
import 'package:demo_project/features/splash/splash_screen.dart';
import 'package:demo_project/features/usermanagement/screens/user_management_screen.dart';
import 'package:demo_project/features/usermanagement/screens/user_form_screen.dart';
import 'package:demo_project/features/usermanagement/screens/user_details_screen.dart';

class AppRoutes {
  AppRoutes._privateConstructor();
  static final AppRoutes _instance = AppRoutes._privateConstructor();

  static const String splash = '/splash';
  static const String userManagement = '/user-management';
  static const String userForm = '/user-form';
  static const String userDetails = '/user-details';

  static List<GetPage> get pages => _instance._pages;

  List<GetPage> get _pages => [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: userManagement,
      page: () => const UserManagementScreen(),
    ),
    GetPage(
      name: userForm,
      page: () => const UserFormScreen(),
    ),
    GetPage(
      name: userDetails,
      page: () => const UserDetailsScreen(),
    ),
  ];
}
