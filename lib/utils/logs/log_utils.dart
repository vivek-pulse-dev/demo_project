import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class LogUtils {
  LogUtils._internal() {
    _init();
  }

  static final LogUtils _instance = LogUtils._internal();

  // Instance getter if needed
  static LogUtils get instance => _instance;

  // Optional: initialization logic
  void _init() {
    if (kDebugMode) {
      debugPrint("✅ LogUtils initialized ONLY ONCE");
    }
  }

  // Static methods
  static void info(String message) {
    _instance._info(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _instance._error(message, error, stackTrace);
  }

  static void warning(String message) {
    _instance._warning(message);
  }

  static void debug(String message) {
    _instance._debug(message);
  }

  // Private instance methods
  void _info(String message) {
    if (kDebugMode) {
      dev.log('ℹ️ [INFO]: $message', name: 'APP_LOG');
    }
  }

  void _error(String message, dynamic error, StackTrace? stackTrace) {
    if (kDebugMode) {
      dev.log(
        '❌ [ERROR]: $message',
        name: 'APP_LOG',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _warning(String message) {
    if (kDebugMode) {
      dev.log('⚠️ [WARNING]: $message', name: 'APP_LOG');
    }
  }

  void _debug(String message) {
    if (kDebugMode) {
      debugPrint('🐛 [DEBUG]: $message');
    }
  }
}
