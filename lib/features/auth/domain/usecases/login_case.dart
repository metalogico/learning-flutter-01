import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class LoginCase {
  final AuthRepository repository;

  LoginCase(this.repository);

  Future<AuthToken> call(String email, String password) async {
    // Business validation rules
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }

    if (password.isEmpty) {
      throw ArgumentError('Password cannot be empty');
    }

    // Basic email format validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }

    if (password.length < 6) {
      throw ArgumentError('Password must be at least 6 characters');
    }

    return await repository.login(email, password);
  }
}