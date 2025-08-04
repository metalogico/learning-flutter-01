import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/domain/entities/user.dart';

class LocalStorage {
  static const String _userKey = 'user_data';
  
  final SharedPreferences _prefs;
  
  LocalStorage(this._prefs);
  
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
        _prefs.remove(_userKey);
        return null;
      }
    }
    return null;
  }
  
  Future<void> removeUser() async {
    await _prefs.remove(_userKey);
  }
  
  bool get hasUser => getUser() != null;
  
  // Clear user data
  Future<void> clearUserData() async {
    await removeUser();
  }
}