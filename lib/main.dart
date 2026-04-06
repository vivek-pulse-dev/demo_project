import 'package:demo_project/core/constants/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/core/theme/app_theme.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/utils/services/db_service.dart';
import 'package:demo_project/utils/testing/test_mode_config.dart';

import 'package:demo_project/core/bindings/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Database dependencies BEFORE app start
  await Get.putAsync(() => DbService.init());

  /// Setup test data if mode is enabled
  /// Carefully comment off to below line if you are in production so no needed test data
  // if(kDebugMode) {
  //   await setupTestData();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.themeData,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
