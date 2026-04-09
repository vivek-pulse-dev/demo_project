import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/core/constants/app_colors.dart';
import 'package:demo_project/core/constants/app_strings.dart';

import 'package:demo_project/utils/extensions/date_extensions.dart';
import 'package:demo_project/features/usermanagement/controllers/user_list_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = Get.find<UserListController>().selectedUser.value;

      if (user == null) {
        return const Scaffold(body: Center(child: Text('No user data found.')));
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => NavigationService.goBack(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_rounded),
              tooltip: 'Edit',
              onPressed: () async {
                await NavigationService.navigateTo(
                  AppRoutes.userForm,
                  arguments: user,
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar / Header
              Center(
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    '${user.firstName[0]}${user.lastName[0]}'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 12),
              _DetailRow(
                icon: Icons.person_outline,
                label: AppStrings.firstNameLabel,
                value: user.firstName,
              ),
              const SizedBox(height: 16),
              _DetailRow(
                icon: Icons.person_outline,
                label: AppStrings.lastNameLabel,
                value: user.lastName,
              ),
              const SizedBox(height: 16),
              _DetailRow(
                icon: Icons.email_outlined,
                label: AppStrings.emailLabel,
                value: user.email,
              ),
              const SizedBox(height: 16),
              _DetailRow(
                icon: Icons.cake_outlined,
                label: AppStrings.dobLabel,
                value: user.birthDate.toDisplayDate(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
