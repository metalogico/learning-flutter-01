import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/domain/entities/user.dart';
import 'secure_storage.dart';

class LocalStorage {
  static const String _userKey = 'user_data';
  
  final SharedPreferences _prefs;
  final SecureStorage _secureStorage;
  
  LocalStorage(this._prefs, this._secureStorage);
  
  // Auth Token Methods
  Future<void> saveToken(String accessToken) async {
    await _secureStorage.saveAccessToken(accessToken);
  }
  
  Future<String?> getToken() async {
    return await _secureStorage.getAccessToken();
  }
  
  Future<void> removeToken() async {
    await _secureStorage.removeAccessToken();
  }
  
  // User Data Methods
  Future<void> saveUser(User user) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
  }
  
  User? getUser() {
    final userData = _prefs.getString(_userKey);
    if (userData != null) {
      try {
        return User.fromJson(jsonDecode(userData));
      } catch (e) {
        // Se c'è un errore nel parsing, rimuovi i dati corrotti
        _prefs.remove(_userKey);
        return null;
      }
    }
    return null;
  }
  
  Future<void> removeUser() async {
    await _prefs.remove(_userKey);
  }
  
  // Auth Status Check
  Future<bool> get hasToken async => (await getToken()) != null;
  bool get hasUser => getUser() != null;
  Future<bool> get isAuthenticated async => (await hasToken) && hasUser;
  
  // Clear all auth data
  Future<void> clearAuthData() async {
    await Future.wait([
      removeToken(),
      removeUser(),
    ]);
  }
}