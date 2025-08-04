// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id; String get name; String get email;@JsonKey(name: 'email_verified_at') DateTime? get emailVerifiedAt;@JsonKey(name: 'last_login_at') DateTime? get lastLoginAt;@JsonKey(name: 'password_expires_at') DateTime? get passwordExpiresAt;@JsonKey(name: 'dms_password') String? get dmsPassword;@JsonKey(name: 'dms_username') String? get dmsUsername;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'two_factor_expires_at') DateTime? get twoFactorExpiresAt;@JsonKey(name: 'two_factor_verified') bool? get twoFactorVerified;@JsonKey(name: 'two_factor_verified_at') DateTime? get twoFactorVerifiedAt;@JsonKey(name: 'refresh_token') String? get refreshToken;@JsonKey(name: 'refresh_token_expires_at') DateTime? get refreshTokenExpiresAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.passwordExpiresAt, passwordExpiresAt) || other.passwordExpiresAt == passwordExpiresAt)&&(identical(other.dmsPassword, dmsPassword) || other.dmsPassword == dmsPassword)&&(identical(other.dmsUsername, dmsUsername) || other.dmsUsername == dmsUsername)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.twoFactorExpiresAt, twoFactorExpiresAt) || other.twoFactorExpiresAt == twoFactorExpiresAt)&&(identical(other.twoFactorVerified, twoFactorVerified) || other.twoFactorVerified == twoFactorVerified)&&(identical(other.twoFactorVerifiedAt, twoFactorVerifiedAt) || other.twoFactorVerifiedAt == twoFactorVerifiedAt)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,emailVerifiedAt,lastLoginAt,passwordExpiresAt,dmsPassword,dmsUsername,createdAt,updatedAt,twoFactorExpiresAt,twoFactorVerified,twoFactorVerifiedAt,refreshToken,refreshTokenExpiresAt);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, lastLoginAt: $lastLoginAt, passwordExpiresAt: $passwordExpiresAt, dmsPassword: $dmsPassword, dmsUsername: $dmsUsername, createdAt: $createdAt, updatedAt: $updatedAt, twoFactorExpiresAt: $twoFactorExpiresAt, twoFactorVerified: $twoFactorVerified, twoFactorVerifiedAt: $twoFactorVerifiedAt, refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'last_login_at') DateTime? lastLoginAt,@JsonKey(name: 'password_expires_at') DateTime? passwordExpiresAt,@JsonKey(name: 'dms_password') String? dmsPassword,@JsonKey(name: 'dms_username') String? dmsUsername,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'two_factor_expires_at') DateTime? twoFactorExpiresAt,@JsonKey(name: 'two_factor_verified') bool? twoFactorVerified,@JsonKey(name: 'two_factor_verified_at') DateTime? twoFactorVerifiedAt,@JsonKey(name: 'refresh_token') String? refreshToken,@JsonKey(name: 'refresh_token_expires_at') DateTime? refreshTokenExpiresAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? emailVerifiedAt = freezed,Object? lastLoginAt = freezed,Object? passwordExpiresAt = freezed,Object? dmsPassword = freezed,Object? dmsUsername = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? twoFactorExpiresAt = freezed,Object? twoFactorVerified = freezed,Object? twoFactorVerifiedAt = freezed,Object? refreshToken = freezed,Object? refreshTokenExpiresAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,passwordExpiresAt: freezed == passwordExpiresAt ? _self.passwordExpiresAt : passwordExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dmsPassword: freezed == dmsPassword ? _self.dmsPassword : dmsPassword // ignore: cast_nullable_to_non_nullable
as String?,dmsUsername: freezed == dmsUsername ? _self.dmsUsername : dmsUsername // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,twoFactorExpiresAt: freezed == twoFactorExpiresAt ? _self.twoFactorExpiresAt : twoFactorExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,twoFactorVerified: freezed == twoFactorVerified ? _self.twoFactorVerified : twoFactorVerified // ignore: cast_nullable_to_non_nullable
as bool?,twoFactorVerifiedAt: freezed == twoFactorVerifiedAt ? _self.twoFactorVerifiedAt : twoFactorVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,refreshTokenExpiresAt: freezed == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'last_login_at')  DateTime? lastLoginAt, @JsonKey(name: 'password_expires_at')  DateTime? passwordExpiresAt, @JsonKey(name: 'dms_password')  String? dmsPassword, @JsonKey(name: 'dms_username')  String? dmsUsername, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'two_factor_expires_at')  DateTime? twoFactorExpiresAt, @JsonKey(name: 'two_factor_verified')  bool? twoFactorVerified, @JsonKey(name: 'two_factor_verified_at')  DateTime? twoFactorVerifiedAt, @JsonKey(name: 'refresh_token')  String? refreshToken, @JsonKey(name: 'refresh_token_expires_at')  DateTime? refreshTokenExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerifiedAt,_that.lastLoginAt,_that.passwordExpiresAt,_that.dmsPassword,_that.dmsUsername,_that.createdAt,_that.updatedAt,_that.twoFactorExpiresAt,_that.twoFactorVerified,_that.twoFactorVerifiedAt,_that.refreshToken,_that.refreshTokenExpiresAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'last_login_at')  DateTime? lastLoginAt, @JsonKey(name: 'password_expires_at')  DateTime? passwordExpiresAt, @JsonKey(name: 'dms_password')  String? dmsPassword, @JsonKey(name: 'dms_username')  String? dmsUsername, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'two_factor_expires_at')  DateTime? twoFactorExpiresAt, @JsonKey(name: 'two_factor_verified')  bool? twoFactorVerified, @JsonKey(name: 'two_factor_verified_at')  DateTime? twoFactorVerifiedAt, @JsonKey(name: 'refresh_token')  String? refreshToken, @JsonKey(name: 'refresh_token_expires_at')  DateTime? refreshTokenExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.email,_that.emailVerifiedAt,_that.lastLoginAt,_that.passwordExpiresAt,_that.dmsPassword,_that.dmsUsername,_that.createdAt,_that.updatedAt,_that.twoFactorExpiresAt,_that.twoFactorVerified,_that.twoFactorVerifiedAt,_that.refreshToken,_that.refreshTokenExpiresAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email, @JsonKey(name: 'email_verified_at')  DateTime? emailVerifiedAt, @JsonKey(name: 'last_login_at')  DateTime? lastLoginAt, @JsonKey(name: 'password_expires_at')  DateTime? passwordExpiresAt, @JsonKey(name: 'dms_password')  String? dmsPassword, @JsonKey(name: 'dms_username')  String? dmsUsername, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'two_factor_expires_at')  DateTime? twoFactorExpiresAt, @JsonKey(name: 'two_factor_verified')  bool? twoFactorVerified, @JsonKey(name: 'two_factor_verified_at')  DateTime? twoFactorVerifiedAt, @JsonKey(name: 'refresh_token')  String? refreshToken, @JsonKey(name: 'refresh_token_expires_at')  DateTime? refreshTokenExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerifiedAt,_that.lastLoginAt,_that.passwordExpiresAt,_that.dmsPassword,_that.dmsUsername,_that.createdAt,_that.updatedAt,_that.twoFactorExpiresAt,_that.twoFactorVerified,_that.twoFactorVerifiedAt,_that.refreshToken,_that.refreshTokenExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.name, required this.email, @JsonKey(name: 'email_verified_at') this.emailVerifiedAt, @JsonKey(name: 'last_login_at') this.lastLoginAt, @JsonKey(name: 'password_expires_at') this.passwordExpiresAt, @JsonKey(name: 'dms_password') this.dmsPassword, @JsonKey(name: 'dms_username') this.dmsUsername, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'two_factor_expires_at') this.twoFactorExpiresAt, @JsonKey(name: 'two_factor_verified') this.twoFactorVerified, @JsonKey(name: 'two_factor_verified_at') this.twoFactorVerifiedAt, @JsonKey(name: 'refresh_token') this.refreshToken, @JsonKey(name: 'refresh_token_expires_at') this.refreshTokenExpiresAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;
@override@JsonKey(name: 'email_verified_at') final  DateTime? emailVerifiedAt;
@override@JsonKey(name: 'last_login_at') final  DateTime? lastLoginAt;
@override@JsonKey(name: 'password_expires_at') final  DateTime? passwordExpiresAt;
@override@JsonKey(name: 'dms_password') final  String? dmsPassword;
@override@JsonKey(name: 'dms_username') final  String? dmsUsername;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'two_factor_expires_at') final  DateTime? twoFactorExpiresAt;
@override@JsonKey(name: 'two_factor_verified') final  bool? twoFactorVerified;
@override@JsonKey(name: 'two_factor_verified_at') final  DateTime? twoFactorVerifiedAt;
@override@JsonKey(name: 'refresh_token') final  String? refreshToken;
@override@JsonKey(name: 'refresh_token_expires_at') final  DateTime? refreshTokenExpiresAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerifiedAt, emailVerifiedAt) || other.emailVerifiedAt == emailVerifiedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.passwordExpiresAt, passwordExpiresAt) || other.passwordExpiresAt == passwordExpiresAt)&&(identical(other.dmsPassword, dmsPassword) || other.dmsPassword == dmsPassword)&&(identical(other.dmsUsername, dmsUsername) || other.dmsUsername == dmsUsername)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.twoFactorExpiresAt, twoFactorExpiresAt) || other.twoFactorExpiresAt == twoFactorExpiresAt)&&(identical(other.twoFactorVerified, twoFactorVerified) || other.twoFactorVerified == twoFactorVerified)&&(identical(other.twoFactorVerifiedAt, twoFactorVerifiedAt) || other.twoFactorVerifiedAt == twoFactorVerifiedAt)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.refreshTokenExpiresAt, refreshTokenExpiresAt) || other.refreshTokenExpiresAt == refreshTokenExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,emailVerifiedAt,lastLoginAt,passwordExpiresAt,dmsPassword,dmsUsername,createdAt,updatedAt,twoFactorExpiresAt,twoFactorVerified,twoFactorVerifiedAt,refreshToken,refreshTokenExpiresAt);

@override
String toString() {
  return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, lastLoginAt: $lastLoginAt, passwordExpiresAt: $passwordExpiresAt, dmsPassword: $dmsPassword, dmsUsername: $dmsUsername, createdAt: $createdAt, updatedAt: $updatedAt, twoFactorExpiresAt: $twoFactorExpiresAt, twoFactorVerified: $twoFactorVerified, twoFactorVerifiedAt: $twoFactorVerifiedAt, refreshToken: $refreshToken, refreshTokenExpiresAt: $refreshTokenExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email,@JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,@JsonKey(name: 'last_login_at') DateTime? lastLoginAt,@JsonKey(name: 'password_expires_at') DateTime? passwordExpiresAt,@JsonKey(name: 'dms_password') String? dmsPassword,@JsonKey(name: 'dms_username') String? dmsUsername,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'two_factor_expires_at') DateTime? twoFactorExpiresAt,@JsonKey(name: 'two_factor_verified') bool? twoFactorVerified,@JsonKey(name: 'two_factor_verified_at') DateTime? twoFactorVerifiedAt,@JsonKey(name: 'refresh_token') String? refreshToken,@JsonKey(name: 'refresh_token_expires_at') DateTime? refreshTokenExpiresAt
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? emailVerifiedAt = freezed,Object? lastLoginAt = freezed,Object? passwordExpiresAt = freezed,Object? dmsPassword = freezed,Object? dmsUsername = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? twoFactorExpiresAt = freezed,Object? twoFactorVerified = freezed,Object? twoFactorVerifiedAt = freezed,Object? refreshToken = freezed,Object? refreshTokenExpiresAt = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerifiedAt: freezed == emailVerifiedAt ? _self.emailVerifiedAt : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,passwordExpiresAt: freezed == passwordExpiresAt ? _self.passwordExpiresAt : passwordExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dmsPassword: freezed == dmsPassword ? _self.dmsPassword : dmsPassword // ignore: cast_nullable_to_non_nullable
as String?,dmsUsername: freezed == dmsUsername ? _self.dmsUsername : dmsUsername // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,twoFactorExpiresAt: freezed == twoFactorExpiresAt ? _self.twoFactorExpiresAt : twoFactorExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,twoFactorVerified: freezed == twoFactorVerified ? _self.twoFactorVerified : twoFactorVerified // ignore: cast_nullable_to_non_nullable
as bool?,twoFactorVerifiedAt: freezed == twoFactorVerifiedAt ? _self.twoFactorVerifiedAt : twoFactorVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,refreshTokenExpiresAt: freezed == refreshTokenExpiresAt ? _self.refreshTokenExpiresAt : refreshTokenExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
