class AppStrings {
  AppStrings._internal();
  static final AppStrings _instance = AppStrings._internal();
  static AppStrings get instance => _instance;

  // User Management List
  static const String userListTitle = 'User Management';
  static const String searchHint = 'Search by name or email...';
  static const String noUsersFound = 'No users found.';
  static const String deleteUserTitle = 'Delete User';
  static const String deleteConfirm = 'DELETE';
  static const String cancel = 'CANCEL';
  static const String deleteUserMessage =
      'Are you sure you want to delete this user?';

  // User Form
  static const String addUserTitle = 'Add User';
  static const String editUserTitle = 'Edit User';
  static const String firstNameLabel = 'First Name';
  static const String lastNameLabel = 'Last Name';
  static const String emailLabel = 'Email Address';
  static const String passwordLabel = 'Password';
  static const String dobLabel = 'Date of Birth';
  static const String saveButton = 'Save User';
  static const String updateButton = 'Update User';

  // Validation Messages
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Enter a valid email address';
  static const String invalidPassword =
      'Password must be at least 6 characters';
  static const String invalidName = 'At least 2 characters, [a-z/A-Z] only';
  static const String futureDateError = 'Date of birth cannot be in the future';
  static const String emailTaken = 'Email address is already in use';

  // Success Messages
  static const String userCreatedSuccess = 'User created successfully';
  static const String userUpdatedSuccess = 'User updated successfully';
  static const String userDeletedSuccess = 'User deleted successfully';
}
