import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
abstract class AuthToken with _$AuthToken {
  const factory AuthToken({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'access_token_expires_at') required String accessTokenExpiresAt,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'refresh_token_expires_at') required String refreshTokenExpiresAt,
    required User user,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}

// Business Logic Extension  
extension AuthTokenBusinessLogic on AuthToken {
  String get bearerToken => 'Bearer $accessToken';
  
  bool get isValid => accessToken.isNotEmpty;
}