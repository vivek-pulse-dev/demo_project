import 'package:get/get.dart';

class NavigationService {
  NavigationService._privateConstructor();
  static final NavigationService _instance =
      NavigationService._privateConstructor();

  static Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _instance._navigateTo(routeName, arguments: arguments);
  }

  static Future<dynamic>? navigateOffAll(String routeName, {dynamic arguments}) {
    return _instance._navigateOffAll(routeName, arguments: arguments);
  }

  static Future<dynamic>? navigateOff(String routeName, {dynamic arguments}) {
    return _instance._navigateOff(routeName, arguments: arguments);
  }

  static void goBack({dynamic result}) {
    _instance._goBack(result: result);
  }

  // Private instance methods
  Future<dynamic>? _navigateTo(String routeName, {dynamic arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? _navigateOffAll(String routeName, {dynamic arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? _navigateOff(String routeName, {dynamic arguments}) {
    return Get.offNamed(routeName, arguments: arguments);
  }

  void _goBack({dynamic result}) {
    Get.back(result: result);
  }
}
