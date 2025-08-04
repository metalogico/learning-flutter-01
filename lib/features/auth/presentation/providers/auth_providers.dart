import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_case.dart';
import '../../domain/usecases/logout_case.dart';
import '../../domain/usecases/refresh_token_case.dart';
import '../../domain/entities/user.dart';
import '../../../../core/providers/core_providers.dart';

// =============================================================================
// CORE PROVIDERS
// =============================================================================

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = AuthRemoteDataSourceImpl(ref.read(apiClientProvider));
  return AuthRepositoryImpl(dataSource, ref.read(localStorageProvider));
});

final loginUseCaseProvider = Provider<LoginCase>((ref) {
  return LoginCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutCase>((ref) {
  return LogoutCase(ref.read(authRepositoryProvider));
});

final refreshTokenUseCaseProvider = Provider<RefreshTokenCase>((ref) {
  return RefreshTokenCase(ref.read(authRepositoryProvider));
});

// =============================================================================
// AUTH STATE
// =============================================================================

enum AuthStatus { loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? error;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.user,
    this.error,
  });

  AuthState copyWith({AuthStatus? status, User? user, String? error}) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginCase _loginCase;
  final LogoutCase _logoutCase;
  final AuthRepository _repository;

  AuthNotifier(this._loginCase, this._logoutCase, this._repository) 
      : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final isAuth = await _repository.isAuthenticated();
    if (isAuth) {
      final user = await _repository.getCurrentUser();
      state = state.copyWith(status: AuthStatus.authenticated, user: user);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);
    
    try {
      final authToken = await _loginCase.call(email, password);
      state = state.copyWith(
        status: AuthStatus.authenticated, 
        user: authToken.user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error, 
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await _logoutCase.call();
    state = state.copyWith(
      status: AuthStatus.unauthenticated, 
      user: null,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(loginUseCaseProvider),
    ref.read(logoutUseCaseProvider),
    ref.read(authRepositoryProvider),
  );
});