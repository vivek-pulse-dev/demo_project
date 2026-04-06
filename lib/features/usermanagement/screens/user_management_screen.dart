import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/features/usermanagement/controllers/user_list_controller.dart';
import 'package:demo_project/widgets/dialogs/delete_user_dialog.dart';
import 'package:demo_project/utils/logs/log_utils.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/widgets/user_item_widget.dart';
import 'package:demo_project/widgets/empty_state_widget.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class UserManagementScreen extends GetView<UserListController> {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogUtils.info('Building UserManagementScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.userListTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController,
              autofillHints: null,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                fillColor: AppColors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: controller.onSearchChanged,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.users.isEmpty) {
          return const EmptyStateWidget();
        }

        return ListView.builder(
          controller: controller.scrollController,
          itemCount:
              controller.users.length + (controller.hasMoreData.value ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == controller.users.length) {
              return Obx(() => controller.isFetchingMore.value
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    )
                  : const SizedBox.shrink());
            }

            final user = controller.users[index];
            return UserItemWidget(
              user: user,
              onEdit: () async {
                await NavigationService.navigateTo(
                  AppRoutes.userForm,
                  arguments: user,
                );
              },
              onDelete: () {
                DeleteUserDialog.show(context, () {
                  if (user.id != null) {
                    controller.deleteUser(user.id!);
                  }
                });
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationService.navigateTo(AppRoutes.userForm),
        child: const Icon(Icons.add),
      ),
    );
  }
}
