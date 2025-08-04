import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String _accessTokenKey = 'auth_access_token';
  static const String _refreshTokenKey = 'auth_refresh_token';
  
  final FlutterSecureStorage _secureStorage;
  
  SecureStorage(this._secureStorage);
  
  // Access Token Methods
  Future<void> saveAccessToken(String accessToken) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
  }
  
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }
  
  Future<void> removeAccessToken() async {
    await _secureStorage.delete(key: _accessTokenKey);
  }
  
  // Refresh Token Methods
  Future<void> saveRefreshToken(String refreshToken) async {
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }
  
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }
  
  Future<void> removeRefreshToken() async {
    await _secureStorage.delete(key: _refreshTokenKey);
  }
  
  // Utility Methods
  Future<bool> hasAccessToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
  
  Future<void> clearTokens() async {
    await Future.wait([
      removeAccessToken(),
      removeRefreshToken(),
    ]);
  }
}