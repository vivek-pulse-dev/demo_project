import 'package:flutter/material.dart';
import 'package:demo_project/features/usermanagement/models/user.dart';
import 'package:demo_project/widgets/btns/custom_icon_button.dart';
import 'package:demo_project/core/constants/app_colors.dart';

class UserItemWidget extends StatelessWidget {
  final User user;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UserItemWidget({
    super.key,
    required this.user,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15, top: 4, bottom: 4),

        title: Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(user.email, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 2),
            Text(
              user.birthDate,
              style: const TextStyle(fontSize: 12, color: AppColors.grey600),
            ),
          ],
        ),
        trailing: Stack(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          alignment: Alignment.center,
          children: [
            // Text(
            //   '${user.id ?? ''}',
            //   style: const TextStyle(
            //     fontSize: 12,
            //     fontWeight: FontWeight.bold,
            //     color: AppColors.secondaryColor,
            //   ),
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconButton(
                  icon: Icons.edit_rounded,
                  color: AppColors.secondaryColor,
                  onPressed: onEdit,
                  tooltip: 'Edit',
                ),
                CustomIconButton(
                  icon: Icons.delete_rounded,
                  color: AppColors.errorColor,
                  onPressed: onDelete,
                  tooltip: 'Delete',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
