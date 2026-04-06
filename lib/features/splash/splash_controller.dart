import 'package:get/get.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToUserManagement();
  }

  void _navigateToUserManagement() async {
    await Future.delayed(const Duration(seconds: 3));
    NavigationService.navigateOffAll(AppRoutes.userManagement);
  }
}
