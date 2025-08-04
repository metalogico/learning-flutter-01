import '../entities/user.dart';
import '../entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthToken> login(String email, String password);
  Future<void> logout();
  Future<User> getCurrentUser();
  Future<bool> isAuthenticated();
}