import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserCase {
  final AuthRepository repository;

  GetCurrentUserCase(this.repository);

  Future<User> call() async {
    return await repository.getCurrentUser();
  }
}