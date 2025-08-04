import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/domain/entities/user.dart';

class LocalStorage {
  static const String _tokenKey = 'auth_access_token';
  static const String _userKey = 'user_data';
  
  final SharedPreferences _prefs;
  
  LocalStorage(this._prefs);
  
  // Auth Token Methods
  Future<void> saveToken(String accessToken) async {
    await _prefs.setString(_tokenKey, accessToken);
  }
  
  String? getToken() {
    return _prefs.getString(_tokenKey);
  }
  
  Future<void> removeToken() async {
    await _prefs.remove(_tokenKey);
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
  bool get hasToken => getToken() != null;
  bool get hasUser => getUser() != null;
  bool get isAuthenticated => hasToken && hasUser;
  
  // Clear all auth data
  Future<void> clearAuthData() async {
    await Future.wait([
      removeToken(),
      removeUser(),
    ]);
  }
}