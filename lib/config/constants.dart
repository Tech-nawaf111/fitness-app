import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'Fitness App';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 15);
  
  // Storage Keys
  static const String userDataKey = 'user_data';
  static const String settingsKey = 'app_settings';
  static const String workoutDataKey = 'workout_data';
  static const String nutritionDataKey = 'nutrition_data';
  static const String moodDataKey = 'mood_data';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;
  
}