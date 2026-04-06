import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_project/utils/services/navigation_service.dart';
import 'package:demo_project/features/usermanagement/controllers/user_form_controller.dart';
import 'package:demo_project/widgets/custom_text_field.dart';
import 'package:demo_project/utils/validations/validators.dart';
import 'package:demo_project/utils/input_formatters/input_formatters.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/widgets/btns/custom_button.dart';

class UserFormScreen extends GetView<UserFormController> {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.isEditMode.value
                ? AppStrings.editUserTitle
                : AppStrings.addUserTitle,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigationService.goBack();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: controller.firstNameController,
                label: AppStrings.firstNameLabel,
                validator: Validators.validateFirstName,
                inputFormatters: InputFormatters.onlyAlphabetic,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.lastNameController,
                label: AppStrings.lastNameLabel,
                validator: Validators.validateLastName,
                inputFormatters: InputFormatters.onlyAlphabetic,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.emailController,
                label: AppStrings.emailLabel,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
                inputFormatters: InputFormatters.email,
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  label: AppStrings.passwordLabel,
                  obscureText: !controller.isPasswordVisible.value,
                  validator: Validators.validatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: controller.dobController,
                label: AppStrings.dobLabel,
                readOnly: true,
                onTap: () => controller.pickDate(context),
                validator: Validators.validateDob,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              const SizedBox(height: 32),
              Obx(
                () => CustomButton(
                  text: controller.isEditMode.value
                      ? AppStrings.updateButton
                      : AppStrings.saveButton,
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.saveUser(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
