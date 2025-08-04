import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_case.dart';
import '../../domain/usecases/logout_case.dart';
import '../../domain/entities/user.dart';
import '../../../../core/providers/core_providers.dart';

// Solo il repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = AuthRemoteDataSourceImpl(ref.read(apiClientProvider));
  return AuthRepositoryImpl(
    dataSource, 
    ref.read(localStorageProvider),
    ref.read(secureStorageProvider),
  );
});

// Stato semplificato: solo user e loading per UI
class AuthState {
  final User? user;
  final bool isLoading;

  const AuthState({this.user, this.isLoading = false});

  AuthState copyWith({User? user, bool? isLoading}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get isAuthenticated => user != null;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  late final LoginCase _loginCase;
  late final LogoutCase _logoutCase;

  AuthNotifier(this._repository) : super(const AuthState()) {
    _loginCase = LoginCase(_repository);
    _logoutCase = LogoutCase(_repository);
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    
    try {
      final authToken = await _loginCase.call(email, password);
      state = AuthState(user: authToken.user);
    } catch (e) {
      state = const AuthState();
      rethrow; // Lascia che la UI gestisca l'errore
    }
  }

  Future<void> logout() async {
    await _logoutCase.call();
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});