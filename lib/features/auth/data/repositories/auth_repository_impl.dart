import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../../../../core/storage/local_storage.dart';
import '../../../../core/storage/secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorage localStorage;
  final SecureStorage secureStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.localStorage, this.secureStorage);

  @override
  Future<AuthToken> login(String email, String password) async {
    final authToken = await remoteDataSource.login(email, password);
    
    await Future.wait([
      secureStorage.saveAccessToken(authToken.accessToken),
      secureStorage.saveRefreshToken(authToken.refreshToken),
      localStorage.saveUser(authToken.user),
    ]);
    
    return authToken;
  }

  @override
  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
    } catch (e) {
      // Anche se il logout remoto fallisce, pulisci i dati locali
    } finally {
      await _clearAllAuthData();
    }
  }

  @override
  Future<User> getCurrentUser() async {
    final cachedUser = localStorage.getUser();
    if (cachedUser != null) {
      return cachedUser;
    }
    
    if (await secureStorage.hasAccessToken()) {
      final user = await remoteDataSource.getCurrentUser();
      await localStorage.saveUser(user);
      return user;
    }
    
    throw Exception('User not authenticated');
  }

  @override
  Future<bool> isAuthenticated() async {
    if (!await _hasCompleteAuthData()) {
      return false;
    }
    
    try {
      await getCurrentUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Helper methods privati
  Future<bool> _hasCompleteAuthData() async {
    return await secureStorage.hasTokens() && localStorage.hasUser;
  }

  Future<void> _clearAllAuthData() async {
    await Future.wait([
      secureStorage.clearTokens(),
      localStorage.clearUserData(),
    ]);
  }
}