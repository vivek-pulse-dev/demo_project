import 'package:flutter/material.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/widgets/btns/custom_button.dart';
import 'package:demo_project/widgets/btns/custom_text_button.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class DeleteUserDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteUserDialog({super.key, required this.onConfirm});

  static void show(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => DeleteUserDialog(onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.deleteUserTitle),
      content: const Text(AppStrings.deleteUserMessage),
      actions: [
        CustomTextButton(
          text: AppStrings.cancel,
          onPressed: () => NavigationService.goBack(),
        ),
        CustomButton(
          text: AppStrings.deleteConfirm,
          backgroundColor: AppColors.errorColor,
          textColor: AppColors.white,
          onPressed: () {
            onConfirm();
            NavigationService.goBack();
          },
        ),
      ],
    );
  }
}
