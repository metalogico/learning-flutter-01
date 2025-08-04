import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import '../storage/local_storage.dart';
import '../storage/secure_storage.dart';

// Core Infrastructure Providers
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
});

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
});

final secureStorageProvider = Provider<SecureStorage>((ref) {
  final flutterSecureStorage = ref.read(flutterSecureStorageProvider);
  return SecureStorage(flutterSecureStorage);
});

final localStorageProvider = Provider<LocalStorage>((ref) {
  final sharedPrefs = ref.read(sharedPreferencesProvider);
  final secureStorage = ref.read(secureStorageProvider);
  return LocalStorage(sharedPrefs, secureStorage);
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final localStorage = ref.read(localStorageProvider);
  return ApiClient(localStorage);
});