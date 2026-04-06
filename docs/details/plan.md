# User Management Flutter App

## Overview
Create a simple Flutter application for User Management with GetX and Floor for local database storage.

## Client Requirements

### Features
- **Splash Screen**: Normal splash screen displaying for 2-3 seconds.
- **User Listing Screen**: Displays full name, birth date, and email address.
  - Search functionality.
  - Infinite scroll pagination (default page size = 10).
- **User Form Screen**: One reusable screen for Adding and Editing users.
  - Pre-filled fields when in Edit mode.
  - Date picker for Birth Date.
  - Email uniqueness check.
  - Input formatters and custom validators.
- **Actions**: Edit/Delete functionality with a confirmation dialog for delete.
- **Empty State**: Proper UI representation when no users are added.

### UI & System Behavior
- Auto-update the list after add/edit/delete using GetX.
- Proper form validations and error handling throughout.

## Technical Specifications
- **Framework**: Flutter (Dart)
- **State Management**: GetX (Obx, RxList, Get navigation)
- **Local Database**: Floor
- **Pagination**: Infinite scroll using `ScrollController` (load 10 records per page, stop when less than 10 records returned).
- **UI Components**: Use customized widgets for buttons, text fields, empty state, and list items.
