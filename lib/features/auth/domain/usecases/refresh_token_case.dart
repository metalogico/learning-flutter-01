import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class RefreshTokenCase {
  final AuthRepository repository;

  RefreshTokenCase(this.repository);

  Future<AuthToken> call(String refreshToken) async {
    // Business validation rules
    if (refreshToken.isEmpty) {
      throw ArgumentError('Refresh token cannot be empty');
    }

    return await repository.refreshToken(refreshToken);
  }
}