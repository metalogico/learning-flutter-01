import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'password_expires_at') DateTime? passwordExpiresAt,
    @JsonKey(name: 'dms_password') String? dmsPassword,
    @JsonKey(name: 'dms_username') String? dmsUsername,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'two_factor_expires_at') DateTime? twoFactorExpiresAt,
    @JsonKey(name: 'two_factor_verified') bool? twoFactorVerified,
    @JsonKey(name: 'two_factor_verified_at') DateTime? twoFactorVerifiedAt,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'refresh_token_expires_at') DateTime? refreshTokenExpiresAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// Business Logic Extension
extension UserBusinessLogic on User {
  bool get isEmailVerified => emailVerifiedAt != null;
  
  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}';
    }
    return name.isNotEmpty ? name[0] : '?';
  }
  
  String get displayName => name.isNotEmpty ? name : email;
  
  bool get isTwoFactorEnabled => twoFactorVerified == true;
}