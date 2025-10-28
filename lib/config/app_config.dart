import 'package:flutter/foundation.dart';

enum Environment { dev, staging, prod }

class AppConfig {
  static Environment _environment = Environment.dev;
  
  static Environment get environment => _environment;
  
  static void setEnvironment(Environment env) {
    _environment = env;
  }
  
  static bool get isDev => _environment == Environment.dev;
  static bool get isStaging => _environment == Environment.staging;
  static bool get isProd => _environment == Environment.prod;
  
  static String get appName {
    switch (_environment) {
      case Environment.dev:
        return 'Fitness App Dev';
      case Environment.staging:
        return 'Fitness App Staging';
      case Environment.prod:
        return 'Fitness App';
    }
  }
  
  static String get apiBaseUrl {
    switch (_environment) {
      case Environment.dev:
        return 'https://api-dev.fitnessapp.com';
      case Environment.staging:
        return 'https://api-staging.fitnessapp.com';
      case Environment.prod:
        return 'https://api.fitnessapp.com';
    }
  }
  
  static bool get enableLogging {
    switch (_environment) {
      case Environment.dev:
      case Environment.staging:
        return true;
      case Environment.prod:
        return kDebugMode;
    }
  }
  
  static bool get enableCrashReporting {
    switch (_environment) {
      case Environment.dev:
        return false;
      case Environment.staging:
      case Environment.prod:
        return true;
    }
  }
  
  static String get version {
    return '1.0.0+1';
  }
  
  static String get buildNumber {
    switch (_environment) {
      case Environment.dev:
        return '1.0.0-dev';
      case Environment.staging:
        return '1.0.0-staging';
      case Environment.prod:
        return '1.0.0';
    }
  }
}
