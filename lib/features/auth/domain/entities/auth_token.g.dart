// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => _AuthToken(
  accessToken: json['access_token'] as String,
  accessTokenExpiresAt: json['access_token_expires_at'] as String,
  refreshToken: json['refresh_token'] as String,
  refreshTokenExpiresAt: json['refresh_token_expires_at'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthTokenToJson(_AuthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'access_token_expires_at': instance.accessTokenExpiresAt,
      'refresh_token': instance.refreshToken,
      'refresh_token_expires_at': instance.refreshTokenExpiresAt,
      'user': instance.user,
    };
