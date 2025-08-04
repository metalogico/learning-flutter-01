import '../../domain/entities/user.dart';
import '../../domain/entities/auth_token.dart';
import '../../../../core/datasources/base_remote_datasource.dart';

abstract class AuthRemoteDataSource {
  Future<AuthToken> login(String email, String password);
  Future<void> logout();
  Future<User> getCurrentUser();
}

class AuthRemoteDataSourceImpl extends BaseRemoteDataSource
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(super.apiClient);

  @override
  Future<AuthToken> login(String email, String password) async {
    return handleRequest(
      apiClient.post('/auth/login', data: {
        'email': email,
        'password': password,
      }),
      (responseData) {
        return AuthToken.fromJson(responseData as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<void> logout() async {
    return handleVoidRequest(apiClient.post('/auth/logout'));
  }

  @override
  Future<User> getCurrentUser() async {
    return handleRequest(
      apiClient.get('/auth/user'),
      (responseData) {
        return User.fromJson(responseData as Map<String, dynamic>);
      },
    );
  }
}