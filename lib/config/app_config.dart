class AppConfig {
  // API Configuration
  static const bool _useLocalApi = false;

  static String get baseUrl => _useLocalApi
    ? 'http://10.0.2.2:8000/api'
    : 'https://dummyjson.com';      // Cambia questo

  static const int apiTimeout = 30000;
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 30000;

  // App Configuration
  static const String appName = 'Test Flutter';
  static const String appVersion = '1.0.0';
  static const bool debugMode = true;

  // UI Configuration
  static const int itemsPerPage = 20;
  static const Duration loadingDelay = Duration(milliseconds: 300);

  // Helper Methods
  static bool get isLocal => _useLocalApi;

  static void logConfig() {
    if (debugMode) {
      print('=== APP CONFIG ===');
      print('Base URL: $baseUrl');
      print('Debug Mode: $debugMode');
      print('Local API: $_useLocalApi');
      print('==================');
    }
  }
}