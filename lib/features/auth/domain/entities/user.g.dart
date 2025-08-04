// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'] == null
      ? null
      : DateTime.parse(json['email_verified_at'] as String),
  lastLoginAt: json['last_login_at'] == null
      ? null
      : DateTime.parse(json['last_login_at'] as String),
  passwordExpiresAt: json['password_expires_at'] == null
      ? null
      : DateTime.parse(json['password_expires_at'] as String),
  dmsPassword: json['dms_password'] as String?,
  dmsUsername: json['dms_username'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  twoFactorExpiresAt: json['two_factor_expires_at'] == null
      ? null
      : DateTime.parse(json['two_factor_expires_at'] as String),
  twoFactorVerified: json['two_factor_verified'] as bool?,
  twoFactorVerifiedAt: json['two_factor_verified_at'] == null
      ? null
      : DateTime.parse(json['two_factor_verified_at'] as String),
  refreshToken: json['refresh_token'] as String?,
  refreshTokenExpiresAt: json['refresh_token_expires_at'] == null
      ? null
      : DateTime.parse(json['refresh_token_expires_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
  'last_login_at': instance.lastLoginAt?.toIso8601String(),
  'password_expires_at': instance.passwordExpiresAt?.toIso8601String(),
  'dms_password': instance.dmsPassword,
  'dms_username': instance.dmsUsername,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'two_factor_expires_at': instance.twoFactorExpiresAt?.toIso8601String(),
  'two_factor_verified': instance.twoFactorVerified,
  'two_factor_verified_at': instance.twoFactorVerifiedAt?.toIso8601String(),
  'refresh_token': instance.refreshToken,
  'refresh_token_expires_at': instance.refreshTokenExpiresAt?.toIso8601String(),
};
