class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = 'Something went wrong', this.prefix]);

  @override
  String toString() {
    return "${prefix ?? 'Error'}: $message";
  }
}

class DatabaseException extends AppException {
  DatabaseException([String message = 'Failed to access database'])
      : super(message, 'Database');
}

class ValidationException extends AppException {
  ValidationException([String message = 'Invalid input provided'])
      : super(message, 'Validation');
}

class DuplicateEntryException extends AppException {
  DuplicateEntryException([String message = 'Entry already exists'])
      : super(message, 'Conflict');
}

class UserNotFoundException extends AppException {
  UserNotFoundException([String message = 'User not found in the system'])
      : super(message, 'Not Found');
}
