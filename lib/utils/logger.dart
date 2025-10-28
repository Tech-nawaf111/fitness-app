import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';

enum LogLevel { debug, info, warning, error, fatal }

class Logger {
  static const String _tag = 'FitnessApp';
  
  static void debug(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.debug, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  static void info(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.info, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  static void warning(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  static void fatal(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.fatal, message, tag: tag, error: error, stackTrace: stackTrace);
  }
  
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!AppConfig.enableLogging) return;
    
    final logTag = tag ?? _tag;
    final timestamp = DateTime.now().toIso8601String();
    final levelString = level.name.toUpperCase();
    
    final logMessage = '[$timestamp] [$levelString] [$logTag] $message';
    
    if (kDebugMode) {
      developer.log(
        logMessage,
        name: logTag,
        error: error,
        stackTrace: stackTrace,
        level: _getLogLevelValue(level),
      );
    } else {
      // In release mode, you might want to send logs to a remote service
      _sendToRemoteService(level, logMessage, error, stackTrace);
    }
  }
  
  static int _getLogLevelValue(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
      case LogLevel.fatal:
        return 1200;
    }
  }
  
  static void _sendToRemoteService(
    LogLevel level,
    String message,
    Object? error,
    StackTrace? stackTrace,
  ) {
    // Implement remote logging service integration here
    // For example: Firebase Crashlytics, Sentry, etc.
    if (AppConfig.enableCrashReporting && level.index >= LogLevel.error.index) {
      // Send to crash reporting service
    }
  }
  
  // Performance logging
  static void performance(String operation, Duration duration) {
    if (AppConfig.enableLogging) {
      debug('Performance: $operation took ${duration.inMilliseconds}ms');
    }
  }
  
  // API logging
  static void apiRequest(String method, String url, Map<String, dynamic>? headers) {
    if (AppConfig.enableLogging) {
      debug('API Request: $method $url', tag: 'API');
    }
  }
  
  static void apiResponse(String method, String url, int statusCode, Duration duration) {
    if (AppConfig.enableLogging) {
      debug('API Response: $method $url - $statusCode (${duration.inMilliseconds}ms)', tag: 'API');
    }
  }
  
  static void apiError(String method, String url, int statusCode, String error) {
    warning('API Error: $method $url - $statusCode: $error', tag: 'API');
  }
}
