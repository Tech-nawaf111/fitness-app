import 'dart:ui';

import 'package:flutter/material.dart';
import 'logger.dart';

class AppError {
  final String message;
  final String? code;
  final ErrorType type;
  final Object? originalError;
  final StackTrace? stackTrace;

  const AppError({
    required this.message,
    this.code,
    required this.type,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => 'AppError: $message (${type.name})';
}

enum ErrorType {
  network,
  server,
  validation,
  authentication,
  authorization,
  notFound,
  timeout,
  unknown,
}

class ErrorHandler {
  static void handleError(
    Object error,
    StackTrace? stackTrace, {
    String? context,
    bool showSnackBar = true,
    BuildContext? buildContext,
  }) {
    final appError = _categorizeError(error, stackTrace);
    
    Logger.error(
      'Error in ${context ?? 'unknown context'}: ${appError.message}',
      error: appError.originalError,
      stackTrace: appError.stackTrace,
      tag: 'ErrorHandler',
    );
    
    if (showSnackBar && buildContext != null) {
      _showErrorSnackBar(buildContext, appError);
    }
  }
  
  static AppError _categorizeError(Object error, StackTrace? stackTrace) {
    if (error is AppError) {
      return error;
    }
    
    // Network errors
    if (error.toString().contains('SocketException') ||
        error.toString().contains('HandshakeException') ||
        error.toString().contains('Connection refused')) {
      return AppError(
        message: 'A network error occurred. Please check your internet connection.',
        type: ErrorType.network,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Timeout errors
    if (error.toString().contains('TimeoutException')) {
      return AppError(
        message: 'Request timed out. Please try again.',
        type: ErrorType.timeout,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Validation errors
    if (error.toString().contains('FormatException') ||
        error.toString().contains('Invalid argument')) {
      return AppError(
        message: 'The provided data is invalid. Please check your input.',
        type: ErrorType.validation,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Server errors (5xx)
    if (error.toString().contains('500') ||
        error.toString().contains('502') ||
        error.toString().contains('503')) {
      return AppError(
        message: 'A server error occurred. Please try again later.',
        type: ErrorType.server,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Authentication errors
    if (error.toString().contains('401') ||
        error.toString().contains('Unauthorized')) {
      return AppError(
        message: 'Authentication failed. Please login again.',
        type: ErrorType.authentication,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Authorization errors
    if (error.toString().contains('403') ||
        error.toString().contains('Forbidden')) {
      return AppError(
        message: 'You do not have permission to perform this action.',
        type: ErrorType.authorization,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Not found errors
    if (error.toString().contains('404') ||
        error.toString().contains('Not Found')) {
      return AppError(
        message: 'The requested resource was not found.',
        type: ErrorType.notFound,
        originalError: error,
        stackTrace: stackTrace,
      );
    }
    
    // Unknown error
    return AppError(
      message: 'An unknown error occurred. Please try again later.',
      type: ErrorType.unknown,
      originalError: error,
      stackTrace: stackTrace,
    );
  }
  
  static void _showErrorSnackBar(BuildContext context, AppError error) {
    if (!context.mounted) return;
    
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              error.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red[600],
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  static void showSuccessSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green[600],
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  static void showInfoSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[600],
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
  // Global error handler for uncaught exceptions
  static void initializeErrorHandling() {
    FlutterError.onError = (FlutterErrorDetails details) {
      Logger.fatal(
        'Flutter Error: ${details.exception}',
        error: details.exception,
        stackTrace: details.stack,
        tag: 'FlutterError',
      );
    };
    
    PlatformDispatcher.instance.onError = (error, stack) {
      Logger.fatal(
        'Platform Error: $error',
        error: error,
        stackTrace: stack,
        tag: 'PlatformError',
      );
      return true;
    };
  }
}
