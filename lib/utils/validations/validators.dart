import 'package:get/get.dart';
import 'package:demo_project/core/constants/app_strings.dart';
import 'package:demo_project/utils/extensions/date_extensions.dart';

class Validators {
  Validators._internal();
  static final Validators _instance = Validators._internal();
  static Validators get instance => _instance;

  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.requiredField;
    if (!RegExp(r'^[a-zA-Z]{2,}$').hasMatch(value.trim())) {
      return AppStrings.invalidName;
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.requiredField;
    if (!RegExp(r'^[a-zA-Z]{2,}$').hasMatch(value.trim())) {
      return AppStrings.invalidName;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.requiredField;
    if (!GetUtils.isEmail(value.trim())) return AppStrings.invalidEmail;
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return AppStrings.requiredField;
    if (value.length < 6) return AppStrings.invalidPassword;
    return null;
  }

  static String? validateDob(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.requiredField;
    
    final DateTime? dob = value.toDateTime();
    if (dob == null) return AppStrings.requiredField;

    if (dob.isAfter(DateTime.now())) {
      return AppStrings.futureDateError;
    }
    return null;
  }
}
