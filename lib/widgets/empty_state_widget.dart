import 'package:flutter/material.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? message;
  final IconData icon;

  const EmptyStateWidget({
    Key? key,
    this.message,
    this.icon = Icons.person_off_rounded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColors.grey400,
          ),
          const SizedBox(height: 16),
          Text(
            message ?? AppStrings.noUsersFound,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.grey600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
