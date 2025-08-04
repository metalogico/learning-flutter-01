import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  // API Configuration
  static final bool localEnvironment = dotenv.getBool('APP_LOCAL_ENVIRONMENT');
  static final String baseUrl = dotenv.get('API_BASE_URL');

  static const int apiTimeout = 30000;
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 30000;

  // App Configuration
  static const String appName = 'Product List';
  static const String appVersion = '1.0.0';
  static const bool debugMode = true;

  // UI Configuration
  static const int itemsPerPage = 20;
  static const Duration loadingDelay = Duration(milliseconds: 300);

  static void logConfig() {
    if (debugMode) {
      debugPrint('=== APP CONFIG ===');
      debugPrint('Base URL: $baseUrl');
      debugPrint('Debug Mode: $debugMode');
      debugPrint('==================');
    }
  }
}