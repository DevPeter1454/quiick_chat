# Quiick Chat

A modern Flutter chat application built with the Stacked architecture.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Stacked CLI
- Git

### Installation

1. Install the Stacked CLI globally:

```bash
dart pub global activate stacked_cli
```

2. Clone the repository and install dependencies:

```bash
git clone <repository-url>
cd quiick_chat
flutter pub get
```

### Git Workflow

#### Setting Up Remote

```bash
# Check current remote
git remote -v

# If remote is not set, add it
git remote add origin <repository-url>

# Set upstream branch
git branch --set-upstream-to=origin/main main
```

#### Handling Large Files

The project uses `.gitignore` to exclude build files and large binaries. If you need to track large files:

1. Install Git LFS:

```bash
# macOS
brew install git-lfs

# Windows
git lfs install
```

2. Track large files:

```bash
git lfs track "*.apk"
git lfs track "*.aab"
git lfs track "*.bin"
```

3. Add and commit the `.gitattributes` file:

```bash
git add .gitattributes
git commit -m "Configure Git LFS"
```

#### Common Git Commands

```bash
# Pull latest changes
git pull origin main

# Create and switch to a new branch
git checkout -b feature/your-feature-name

# Stage changes
git add .

# Commit changes
git commit -m "Your commit message"

# Push changes
git push origin feature/your-feature-name
```

#### Branch Naming Convention

- `feature/`: For new features
- `bugfix/`: For bug fixes
- `hotfix/`: For urgent fixes
- `release/`: For release preparation

## Project Structure

```
lib/
├── app/           # App configuration and routing
├── models/        # Data models
├── repository/    # Data repositories
├── services/      # Business logic services
├── shared/        # Shared utilities and constants
├── ui/            # UI components
│   ├── views/     # Screens and their viewmodels
│   ├── widgets/   # Reusable widgets
│   ├── bottom_sheets/  # Bottom sheets
│   └── dialogs/   # Dialogs
└── utils/         # Utility functions
```

## Development Guide

### Creating New Components

#### Creating a New View

```bash
stacked create view profile
```

This will:

- Create `lib/ui/views/profile/profile_view.dart`
- Create `lib/ui/views/profile/profile_viewmodel.dart`
- Create test file in `test/viewmodels/profile_viewmodel_test.dart`
- Add route to `app.dart`

#### Creating a New Service

```bash
stacked create service chat
```

This will:

- Create `lib/services/chat_service.dart`
- Create test file in `test/services/chat_service_test.dart`
- Register service in `app.dart`
- Add mock in `test_helpers.dart`

#### Creating a New Bottom Sheet

```bash
stacked create bottom_sheet settings
```

This will:

- Create `lib/ui/bottom_sheets/settings/settings_sheet.dart`
- Create `lib/ui/bottom_sheets/settings/settings_sheet_model.dart`
- Register in `app.dart`

#### Creating a New Dialog

```bash
stacked create dialog confirmation
```

This will:

- Create `lib/ui/dialogs/confirmation/confirmation_dialog.dart`
- Create `lib/ui/dialogs/confirmation/confirmation_dialog_model.dart`
- Register in `app.dart`

#### Creating a New Widget

```bash
stacked create widget message_bubble
```

This will:

- Create `lib/ui/widgets/common/message_bubble/message_bubble.dart`
- Create `lib/ui/widgets/common/message_bubble/message_bubble_model.dart`
- Create test file in `test/widget_models/message_bubble_model_test.dart`

### Code Generation

After making manual changes or adding new models, run:

```bash
stacked generate
```

This is equivalent to `flutter pub run build_runner build --delete-conflicting-outputs`

### Configuration

Create a `stacked.json` in your project root to customize paths:

```json
{
  "bottom_sheets_path": "ui/bottom_sheets",
  "dialogs_path": "ui/dialogs",
  "line_length": 80,
  "locator_name": "locator",
  "prefer_web": true,
  "register_mocks_function": "registerServices",
  "services_path": "services",
  "stacked_app_file_path": "app/app.dart",
  "test_helpers_file_path": "helpers/test_helpers.dart",
  "test_services_path": "services",
  "test_views_path": "viewmodels",
  "test_widgets_path": "widget_models",
  "v1": false,
  "views_path": "ui/views",
  "widgets_path": "ui/widgets/common"
}
```

### Template Identifiers

Add these comments in your files to enable automatic modifications:

In `lib/app/app.dart`:

```dart
// @stacked-import
// @stacked-route
// @stacked-service
// @stacked-bottom-sheet
// @stacked-dialog
```

In `test/helpers/test_helpers.dart`:

```dart
// @stacked-import
// @stacked-mock-spec
// @stacked-mock-create
// @stacked-mock-register
```

### Best Practices

1. **Service Organization**: Follow the pattern in `api_service.dart` for service implementation
2. **View Structure**: Keep views and viewmodels in the same directory
3. **Testing**: Use the generated test files as templates for your tests
4. **Code Generation**: Run `stacked generate` after making changes to models or services

### Updating CLI

To update the Stacked CLI:

```bash
stacked update
```

## Testing

### Golden Tests

Golden tests are already setup for this project. To run the tests and update the golden files, run:

```bash
flutter test --update-goldens
```

The golden test screenshots will be stored under `test/golden/`.

## API Service

The `ApiService` is a core service that handles all HTTP communications in the application. It's built using the Dio package and implements a robust error handling system.

### Features

1. **Authentication Management**

   - Automatic token management
   - Token persistence using local storage
   - Automatic header injection for authenticated requests

2. **Request Methods**

   ```dart
   // GET request
   Future<Result<T>> get<T>(String path, {
     Map<String, dynamic>? queryParameters,
     required T Function(dynamic data) fromJson,
     bool requiresAuth = true,
   })

   // POST request
   Future<Result<T>> post<T>(String path, {
     dynamic data,
     Map<String, dynamic>? queryParameters,
     required T Function(dynamic data) fromJson,
     bool requiresAuth = true,
   })

   // PUT request
   Future<Result<T>> put<T>(String path, {
     dynamic data,
     Map<String, dynamic>? queryParameters,
     required T Function(dynamic data) fromJson,
     bool requiresAuth = true,
   })

   // DELETE request
   Future<Result<T>> delete<T>(String path, {
     dynamic data,
     Map<String, dynamic>? queryParameters,
     required T Function(dynamic data) fromJson,
     bool requiresAuth = true,
   })

   // File upload
   Future<Result<T>> uploadFile<T>(String path, {
     required File file,
     required String fileField,
     Map<String, dynamic>? fields,
     required T Function(dynamic data) fromJson,
     bool requiresAuth = true,
     void Function(int sent, int total)? onSendProgress,
   })
   ```

3. **Error Handling**
   The service handles various HTTP error scenarios:

   - 400: Bad Request
   - 401/403: Authentication failures
   - 413: File size too large
   - 422: Validation errors
   - Network timeouts
   - Connection errors
   - Server errors

4. **Response Handling**
   All responses are wrapped in a `Result<T>` class that provides:
   - Type-safe data access
   - Error information
   - Helper methods for accessing nested data
   - Token extraction
   - User data extraction

### Usage Example

```dart
// Making an authenticated GET request
final result = await _apiService.get<UserProfile>(
  '/api/profile',
  fromJson: (data) => UserProfile.fromJson(data),
);

if (result.isSuccess) {
  final profile = result.data;
  // Handle success
} else {
  final error = result.failure;
  // Handle error
}

// Uploading a file
final result = await _apiService.uploadFile<UploadResponse>(
  '/api/upload',
  file: imageFile,
  fileField: 'image',
  fields: {'type': 'profile'},
  fromJson: (data) => UploadResponse.fromJson(data),
  onSendProgress: (sent, total) {
    // Handle upload progress
  },
);
```

### Error Types

The service uses a comprehensive error handling system with specific error types:

- `AuthFailure`: Authentication related errors
- `ValidationFailure`: Input validation errors
- `ServerFailure`: Server-side errors
- `NetworkFailure`: Network connectivity issues
- `TimeoutFailure`: Request timeout errors
- `SocketFailure`: Socket/connection errors
- `FormatFailure`: Data format errors
- `InternalFailure`: Unexpected internal errors

### Best Practices

1. Always check `result.isSuccess` before accessing data
2. Use the provided error types for specific error handling
3. Implement proper error messages in the UI
4. Handle file upload progress for better UX
5. Use the `requiresAuth` parameter appropriately for public endpoints
