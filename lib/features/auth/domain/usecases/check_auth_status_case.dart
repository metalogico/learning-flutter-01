import '../repositories/auth_repository.dart';

class CheckAuthStatusCase {
  final AuthRepository repository;

  CheckAuthStatusCase(this.repository);

  Future<bool> call() async {
    return await repository.isAuthenticated();
  }
}