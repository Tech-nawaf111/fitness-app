class StagingConfig {
  static const String appName = 'Fitness App Staging';
  static const String appVersion = '1.0.0-staging';
  static const String buildNumber = '1.0.0-staging';
  
  // API Configuration
  static const String apiBaseUrl = 'https://api-staging.fitnessapp.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Feature Flags
  static const bool enableLogging = true;
  static const bool enableCrashReporting = true;
  static const bool enableAnalytics = true;
  static const bool enableDebugMenu = false;
  static const bool enablePerformanceMonitoring = true;
  
  // Database Configuration
  static const String databaseName = 'fitness_app_staging.db';
  static const int databaseVersion = 1;
  
  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 2);
  static const int maxCacheSize = 100; // MB
  
  // Staging specific settings
  static const bool showDebugBanner = false;
  static const bool enableHotReload = false;
  static const bool enableInspector = false;
  
  // Mock Data Configuration
  static const bool useMockData = false;
  static const bool enableMockDelay = false;
  static const Duration mockDelay = Duration.zero;
  
  // Logging Configuration
  static const String logLevel = 'info';
  static const bool enableConsoleLogging = true;
  static const bool enableFileLogging = true;
  static const String logFileName = 'fitness_app_staging.log';
  
  // Testing Configuration
  static const bool enableTestMode = true;
  static const bool enableBetaFeatures = true;
  static const bool enableExperimentalFeatures = true;
}
