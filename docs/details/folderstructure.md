# Folder Structure

```
lib/
├── core/
│   ├── constants/app_strings.dart
│   ├── theme/app_theme.dart
│   ├── helper/db_helper.dart
│   └── utils/extensions.dart
│
├── features/
│   ├── splash/
│   │   ├── splash_screen.dart
│   │   └── splash_controller.dart
│   └── usermanagement/
│       ├── controllers/
│       │   ├── user_list_controller.dart
│       │   └── user_form_controller.dart
│       ├── screens/
│       │   ├── user_management_screen.dart
│       │   └── user_form_screen.dart
│       └── models/user.dart
│
├── utils/
│   ├── services/db_service.dart
│   ├── validations/validators.dart
│   └── input_formatters/input_formatters.dart
│
├── widgets/
│   ├── custom_button.dart
│   ├── custom_textfield.dart
│   ├── empty_state_widget.dart
│   ├── user_item_widget.dart
│   └── common_widgets.dart
│
├── main.dart
└── routes/app_routes.dart
```
