# Fitness App

A pixel-perfect fitness app with dark theme built with Flutter, featuring workout tracking, nutrition monitoring, mood tracking, and hydration management.

## 1. Dependencies Used & Why

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

## 2. Project Structure

```
lib/
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
└── main.dart               # App entry point and navigation setup
```

### Directory Purposes

- **bloc/**: Contains the business logic layer using the BLoC pattern for state management
- **models/**: Defines data structures and state models used throughout the app
- **screens/**: Contains all the main UI screens that users interact with
- **theme/**: Centralized theming configuration for consistent UI styling
- **widgets/**: Reusable UI components that can be used across multiple screens
- **main.dart**: Application entry point, navigation setup, and global configuration

### Key Features

- **Dark Theme**: Custom dark theme with carefully chosen colors for optimal user experience
- **State Management**: BLoC pattern for predictable state management
- **Modular Architecture**: Well-organized code structure for maintainability
- **Reusable Components**: Custom widgets for consistent UI across the app
- **Cross-Platform**: Built with Flutter for iOS and Android compatibility



