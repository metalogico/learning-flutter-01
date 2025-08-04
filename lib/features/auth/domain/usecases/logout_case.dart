import '../repositories/auth_repository.dart';

class LogoutCase {
  final AuthRepository repository;

  LogoutCase(this.repository);

  Future<void> call() async {
    return await repository.logout();
  }
}