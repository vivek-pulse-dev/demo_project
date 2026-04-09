import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/utils/extensions/date_extensions.dart';
import 'package:demo_project/features/usermanagement/models/user.dart';
import 'package:demo_project/utils/services/db_service.dart';
import 'package:demo_project/features/usermanagement/controllers/user_list_controller.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/utils/logs/log_utils.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/core/exceptions/app_exceptions.dart';
import 'package:demo_project/utils/services/snackbar_service.dart';

class UserFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  RxBool isEditMode = false.obs;
  Rx<User?> currentUser = Rx<User?>(null);

  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args is User) {
      isEditMode.value = true;
      currentUser.value = args;
      _populateForm(args);
    }
    LogUtils.info(
      'UserFormController initialized. EditMode: ${isEditMode.value}',
    );
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dobController.dispose();
    super.onClose();
    LogUtils.info('UserFormController closed');
  }

  void _populateForm(User user) {
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    emailController.text = user.email;
    passwordController.text = user.password;
    dobController.text = user.birthDate.toDisplayDate();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> pickDate(BuildContext context) async {
    // Use already-selected date if present, otherwise today
    final initialDate = dobController.text.toDateTime() ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dobController.text = picked.toDisplayDate();
      LogUtils.info('Date picked: ${dobController.text}');
      formKey.currentState?.validate();
    }
  }

  Future<void> saveUser() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      LogUtils.info('Saving user...');

      try {
        final email = emailController.text.trim().toLowerCase();
        final isExists = await DbService.isEmailExists(
          email,
          excludeId: isEditMode.value ? currentUser.value?.id : null,
        );

        if (isExists) {
          LogUtils.warning('Email already exists: $email');
          throw DuplicateEntryException(AppStrings.emailTaken);
        }

        final user = User(
          id: isEditMode.value ? currentUser.value?.id : null,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: email,
          password: passwordController.text,
          birthDate: dobController.text.trim(),
        );

        int? newId;
        if (isEditMode.value) {
          await DbService.updateUser(user);
          LogUtils.info('User updated: ${user.id}');
        } else {
          newId = await DbService.insertUser(user);
          LogUtils.info('New user created with ID: $newId');
        }

        // Update current list directly for real-time sync
        if (Get.isRegistered<UserListController>()) {
          final listController = Get.find<UserListController>();
          if (isEditMode.value) {
            listController.updateUserInList(user);
            listController.selectedUser.value = user;
          } else {
            final userWithId = User(
              id: newId,
              firstName: user.firstName,
              lastName: user.lastName,
              email: user.email,
              password: user.password,
              birthDate: user.birthDate,
            );
            listController.addUserToList(userWithId);
          }
        }

        NavigationService.goBack(result: user);

        SnackbarService.showSuccess(
          isEditMode.value
              ? AppStrings.userUpdatedSuccess
              : AppStrings.userCreatedSuccess,
        );
      } on DuplicateEntryException catch (e) {
        SnackbarService.showWarning(e.message, title: 'Validation');
      } on DatabaseException catch (e) {
        SnackbarService.showError(e.message, title: 'Database Error');
      } catch (e, stack) {
        LogUtils.error('Failed to save user', e, stack);
        SnackbarService.showError(
          'An unexpected error occurred: ${e.toString()}',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
