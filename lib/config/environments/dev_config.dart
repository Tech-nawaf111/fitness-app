class DevConfig {
  static const String appName = 'Fitness App Dev';
  static const String appVersion = '1.0.0-dev';
  static const String buildNumber = '1.0.0-dev';
  
  // API Configuration
  static const String apiBaseUrl = 'https://api-dev.fitnessapp.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Feature Flags
  static const bool enableLogging = true;
  static const bool enableCrashReporting = false;
  static const bool enableAnalytics = false;
  static const bool enableDebugMenu = true;
  static const bool enablePerformanceMonitoring = true;
  
  // Database Configuration
  static const String databaseName = 'fitness_app_dev.db';
  static const int databaseVersion = 1;
  
  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 1);
  static const int maxCacheSize = 50; // MB
  
  // Development specific settings
  static const bool showDebugBanner = true;
  static const bool enableHotReload = true;
  static const bool enableInspector = true;
  
  // Mock Data Configuration
  static const bool useMockData = true;
  static const bool enableMockDelay = true;
  static const Duration mockDelay = Duration(milliseconds: 500);
  
  // Logging Configuration
  static const String logLevel = 'debug';
  static const bool enableConsoleLogging = true;
  static const bool enableFileLogging = true;
  static const String logFileName = 'fitness_app_dev.log';
}
