class ProdConfig {
  static const String appName = 'Fitness App';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1.0.0';
  
  // API Configuration
  static const String apiBaseUrl = 'https://api.fitnessapp.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Feature Flags
  static const bool enableLogging = false;
  static const bool enableCrashReporting = true;
  static const bool enableAnalytics = true;
  static const bool enableDebugMenu = false;
  static const bool enablePerformanceMonitoring = true;
  
  // Database Configuration
  static const String databaseName = 'fitness_app.db';
  static const int databaseVersion = 1;
  
  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 4);
  static const int maxCacheSize = 200; // MB
  
  // Production specific settings
  static const bool showDebugBanner = false;
  static const bool enableHotReload = false;
  static const bool enableInspector = false;
  
  // Mock Data Configuration
  static const bool useMockData = false;
  static const bool enableMockDelay = false;
  static const Duration mockDelay = Duration.zero;
  
  // Logging Configuration
  static const String logLevel = 'error';
  static const bool enableConsoleLogging = false;
  static const bool enableFileLogging = false;
  static const String logFileName = 'fitness_app_prod.log';
  
  // Security Configuration
  static const bool enableCertificatePinning = true;
  static const bool enableBiometricAuth = true;
  static const bool enableDataEncryption = true;
  
  // Performance Configuration
  static const bool enableImageOptimization = true;
  static const bool enableDataCompression = true;
  static const bool enableLazyLoading = true;
}
