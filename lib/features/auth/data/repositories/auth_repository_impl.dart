import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../../../../core/storage/local_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalStorage localStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.localStorage);

  @override
  Future<AuthToken> login(String email, String password) async {
    final authToken = await remoteDataSource.login(email, password);
    
    // Salva access_token e user in locale
    await Future.wait([
      localStorage.saveToken(authToken.accessToken),
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
      await localStorage.clearAuthData();
    }
  }

  @override
  Future<User> getCurrentUser() async {
    // Prima controlla se abbiamo l'utente in cache locale
    final cachedUser = localStorage.getUser();
    if (cachedUser != null) {
      return cachedUser;
    }
    
    // Se non c'è in cache, prova a recuperarlo dal server
    if (localStorage.hasToken) {
      final user = await remoteDataSource.getCurrentUser();
      await localStorage.saveUser(user);
      return user;
    }
    
    throw Exception('User not authenticated');
  }

  @override
  Future<bool> isAuthenticated() async {
    if (!localStorage.isAuthenticated) {
      return false;
    }
    
    try {
      await getCurrentUser();
      return true;
    } catch (e) {
      return false;
    }
  }
}