import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../storage/local_storage.dart';

// Core Infrastructure Providers
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
});

final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});