# Folder Structure

```
lib/
├── core/
│   ├── bindings/           # GetX Bindings (AppBinding)
│   ├── constants/          # App constants (Strings, Colors, etc.)
│   ├── exceptions/         # Custom App Exceptions
│   ├── helper/             # Database helpers (Floor/SQLite)
│   │   └── floor_db/
│   └── theme/              # App Theme configuration
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
│   ├── extensions/         # Dart/Flutter extensions
│   ├── logs/               # Logging utility
│   ├── services/           # DB, Navigation, Snackbar services
│   ├── testing/            # Test mode configurations
│   └── validations/        # Form validators
│   └── input_formatters/   # Input formatters
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
