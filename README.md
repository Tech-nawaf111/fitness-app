# Fitness App

A professional, pixel-perfect fitness app with dark theme built with Flutter, featuring workout tracking, nutrition monitoring, mood tracking, and hydration management. The app includes a comprehensive flavor system for development, staging, and production environments.

## 🚀 Features

- **Multi-Environment Support**: Separate builds for development, staging, and production
- **Professional Architecture**: Clean code structure with proper separation of concerns
- **Dark Theme**: Carefully designed dark theme for optimal user experience
- **State Management**: BLoC pattern for predictable state management
- **Error Handling**: Comprehensive error handling and logging system
- **Modular Design**: Well-organized code structure for maintainability
- **Cross-Platform**: Built with Flutter for iOS and Android compatibility

## 📱 Environment Flavors

The app supports three different environments with separate configurations:

### Development (dev)
- **Purpose**: Local development and testing
- **Features**: Debug logging, mock data, debug banner
- **API**: Development server
- **App ID**: `com.example.fitness_app.dev`

### Staging (staging)
- **Purpose**: Pre-production testing
- **Features**: Limited logging, real API, testing features
- **API**: Staging server
- **App ID**: `com.example.fitness_app.staging`

### Production (prod)
- **Purpose**: Live app store release
- **Features**: Minimal logging, real API, optimized performance
- **API**: Production server
- **App ID**: `com.example.fitness_app`

## 🛠 Dependencies Used & Why

### Core Dependencies

- **flutter**: The Flutter SDK framework for building cross-platform mobile applications
- **cupertino_icons**: ^1.0.2 - Provides iOS-style icons for consistent UI across platforms

### State Management

- **flutter_bloc**: ^8.1.3 - Used for predictable state management using the BLoC pattern, managing app state changes and data flow
- **equatable**: ^2.0.5 - Used for value equality comparisons in BLoC states and events, ensuring proper state comparison

### Data & Formatting

- **intl**: ^0.18.1 - Used for internationalization and date/time formatting throughout the app

### Charts & Visualizations

- **fl_chart**: ^0.68.0 - Used for creating interactive charts and graphs to display fitness progress and insights
- **syncfusion_flutter_gauges**: ^25.1.35 - Used for creating circular progress indicators and gauge widgets for hydration tracking and other metrics

### Development Dependencies

- **flutter_test**: Flutter's testing framework for unit and widget tests
- **flutter_lints**: ^2.0.0 - Static analysis tool for Dart code to maintain code quality and consistency

## 📁 Project Structure

```
lib/
├── config/                  # Configuration and constants
│   ├── app_config.dart     # Environment configuration management
│   ├── constants.dart      # App-wide constants and strings
│   └── environments/       # Environment-specific configurations
│       ├── dev_config.dart     # Development environment settings
│       ├── staging_config.dart # Staging environment settings
│       └── prod_config.dart    # Production environment settings
├── utils/                   # Utility classes and helpers
│   ├── logger.dart         # Professional logging system
│   └── error_handler.dart  # Comprehensive error handling
├── bloc/                    # State management layer
│   ├── home_bloc.dart      # Main BLoC for managing app state
│   └── home_event.dart     # Events that trigger state changes
├── models/                  # Data models and state definitions
│   └── home_state.dart     # Defines the app's state structure
├── screens/                 # UI screens/pages
│   ├── nutrition_screen.dart    # Nutrition tracking interface
│   ├── plan_screen.dart         # Workout planning and calendar
│   ├── mood_screen.dart         # Mood tracking functionality
│   └── profile_screen.dart      # User profile management
├── theme/                   # App theming and styling
│   └── app_theme.dart      # Dark theme configuration and color scheme
├── widgets/                 # Reusable UI components
│   ├── date_picker_widget.dart  # Custom date selection component
│   ├── hydration_widget.dart    # Water intake tracking widget
│   ├── insights_card.dart       # Progress insights display
│   └── workout_card.dart        # Workout information display
├── main.dart               # Quick development entry point
├── main_dev.dart           # Development environment entry point
├── main_staging.dart       # Staging environment entry point
└── main_prod.dart          # Production environment entry point
```

### Directory Purposes

- **config/**: Centralized configuration management including environment-specific settings
- **utils/**: Utility classes for logging, error handling, and other helper functions
- **bloc/**: Contains the business logic layer using the BLoC pattern for state management
- **models/**: Defines data structures and state models used throughout the app
- **screens/**: Contains all the main UI screens that users interact with
- **theme/**: Centralized theming configuration for consistent UI styling
- **widgets/**: Reusable UI components that can be used across multiple screens
- **main_*.dart**: Environment-specific entry points for different build flavors

## 🏗 Professional Architecture Features

### Environment Management
- **Separate entry points** for each environment (dev, staging, prod)
- **Environment-specific configurations** with different API endpoints, logging levels, and features
- **Build-time configuration** through Android flavors and Flutter targets

### Error Handling & Logging
- **Comprehensive error handling** with categorized error types
- **Professional logging system** with different log levels and environment-specific settings
- **Global error handlers** for uncaught exceptions and Flutter errors
- **User-friendly error messages** with snackbar notifications

### Code Organization
- **Constants management** with centralized app-wide constants
- **Modular architecture** with clear separation of concerns
- **Reusable components** for consistent UI across the app
- **Professional naming conventions** and code structure

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android SDK
- Git

### Quick Development
```bash
# Run development version
flutter run --flavor dev --target lib/main_dev.dart

# Run staging version
flutter run --flavor staging --target lib/main_staging.dart

# Run production version
flutter run --flavor prod --target lib/main_prod.dart
```

### Building APKs

#### Using Build Scripts
```bash
# Build development APK
scripts/build_dev.bat

# Build staging APK
scripts/build_staging.bat

# Build production APK
scripts/build_prod.bat

# Build all flavors
scripts/build_all.bat
```

#### Manual Build Commands
```bash
# Development
flutter build apk --flavor dev --target lib/main_dev.dart --release

# Staging
flutter build apk --flavor staging --target lib/main_staging.dart --release

# Production
flutter build apk --flavor prod --target lib/main_prod.dart --release
```

### Output Locations
- **Development**: `build/app/outputs/flutter-apk/app-dev-release.apk`
- **Staging**: `build/app/outputs/flutter-apk/app-staging-release.apk`
- **Production**: `build/app/outputs/flutter-apk/app-prod-release.apk`

## 📚 Documentation

- **[BUILD.md](BUILD.md)**: Comprehensive build instructions and troubleshooting
- **Code Documentation**: Inline documentation throughout the codebase
- **Environment Configuration**: Detailed configuration for each environment

## 🔧 Configuration

Each environment has its own configuration file with specific settings:

| Feature | Development | Staging | Production |
|---------|-------------|---------|------------|
| Debug Logging | ✅ | ✅ | ❌ |
| Crash Reporting | ❌ | ✅ | ✅ |
| Analytics | ❌ | ✅ | ✅ |
| Debug Menu | ✅ | ❌ | ❌ |
| Mock Data | ✅ | ❌ | ❌ |
| Performance Monitoring | ✅ | ✅ | ✅ |

## 🎯 Key Features

- **Multi-Environment Support**: Professional flavor system for different deployment stages
- **Dark Theme**: Custom dark theme with carefully chosen colors for optimal user experience
- **State Management**: BLoC pattern for predictable state management
- **Error Handling**: Comprehensive error handling and logging system
- **Modular Architecture**: Well-organized code structure for maintainability
- **Reusable Components**: Custom widgets for consistent UI across the app
- **Cross-Platform**: Built with Flutter for iOS and Android compatibility
- **Professional Build System**: Automated build scripts and CI/CD ready configuration


[Download APK](https://github.com/username/project-name/releases/download/v1.0/app-release.apk)


[View Screenshots](https://drive.google.com/drive/folders/1OJko8Bri0qvdM3XGXB3r-mBP5ghStDIY?usp=drive_link)


[Watch App Demo Video](https://drive.google.com/drive/folders/1azgFLLVrwB4YsGxF2eDLqwJlUDwT6kOV?usp=drive_link)

