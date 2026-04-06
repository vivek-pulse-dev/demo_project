import 'package:flutter/services.dart';

class InputFormatters {
  InputFormatters._internal();
  static final InputFormatters _instance = InputFormatters._internal();
  static InputFormatters get instance => _instance;

  // Allow only alphabetic characters firstname & lastname
  static List<TextInputFormatter> get onlyAlphabetic => [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  ];

  // Allow alphanumeric characters but no special ones
  static List<TextInputFormatter> get alphanumeric => [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
  ];

  // For Email: Deny spaces
  static List<TextInputFormatter> get email => [
    FilteringTextInputFormatter.deny(RegExp(r'\s')),
  ];
}
