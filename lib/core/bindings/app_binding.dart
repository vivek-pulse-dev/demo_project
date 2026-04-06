import 'package:get/get.dart';
import 'package:demo_project/utils/services/db_service.dart';
import 'package:demo_project/features/splash/splash_controller.dart';
import 'package:demo_project/features/usermanagement/controllers/user_list_controller.dart';
import 'package:demo_project/features/usermanagement/controllers/user_form_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Database Service
    // Get.putAsync(() => DbService.init());

    // 1. Initial Controller (Immediate initialization)
    Get.put(SplashController());
    Get.lazyPut(() => UserListController());
    // 2. Feature Controllers (Lazy Loaded)
    Get.lazyPut(() => UserFormController(), fenix: true);
    // Note: 'fenix: true' ensures the form controller is re-initialized
    // every time the user enters the form screen.
  }
}







// AppBinding is your app's central wiring station.

// It tells GetX which Controllers and Services to prepare (inject) as soon as the app starts, so they are ready to use the moment a screen needs them.

// In short:

// Registers all your "Brains" (Controllers) in one place.
// Lazily loads them to save memory (they only start when a screen asks for them).
// Cleans up your UI code so screens don't have to worry about finding or creating their own data.