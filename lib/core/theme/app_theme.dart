import 'package:flutter/material.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._privateConstructor();
  static final AppTheme _instance = AppTheme._privateConstructor();

  static ThemeData get themeData => _instance._themeData;

  ThemeData get _themeData {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
        ),
      ),
    );
  }
}
