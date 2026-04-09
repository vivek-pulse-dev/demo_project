import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class SnackbarService {
  SnackbarService._();

  static void showSuccess(String message, {String title = 'Success'}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.successColor.withValues(alpha: 0.8),
    );
  }

  static void showError(String message, {String title = 'Error'}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.errorColor.withValues(alpha: 0.8),
    );
  }

  static void showWarning(String message, {String title = 'Warning'}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: AppColors.warningColor.withValues(alpha: 0.9),
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: AppColors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
