// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get destLat => throw _privateConstructorUsedError;
  double? get destLng => throw _privateConstructorUsedError;
  String? get desetName => throw _privateConstructorUsedError;
  String? get lastAppOpenedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? destLat,
      double? destLng,
      String? desetName,
      String? lastAppOpenedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? destLat = freezed,
    Object? destLng = freezed,
    Object? desetName = freezed,
    Object? lastAppOpenedAt = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      destLat: freezed == destLat
          ? _value.destLat
          : destLat // ignore: cast_nullable_to_non_nullable
              as double?,
      destLng: freezed == destLng
          ? _value.destLng
          : destLng // ignore: cast_nullable_to_non_nullable
              as double?,
      desetName: freezed == desetName
          ? _value.desetName
          : desetName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAppOpenedAt: freezed == lastAppOpenedAt
          ? _value.lastAppOpenedAt
          : lastAppOpenedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? destLat,
      double? destLng,
      String? desetName,
      String? lastAppOpenedAt});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? destLat = freezed,
    Object? destLng = freezed,
    Object? desetName = freezed,
    Object? lastAppOpenedAt = freezed,
  }) {
    return _then(_$_User(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      destLat: freezed == destLat
          ? _value.destLat
          : destLat // ignore: cast_nullable_to_non_nullable
              as double?,
      destLng: freezed == destLng
          ? _value.destLng
          : destLng // ignore: cast_nullable_to_non_nullable
              as double?,
      desetName: freezed == desetName
          ? _value.desetName
          : desetName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAppOpenedAt: freezed == lastAppOpenedAt
          ? _value.lastAppOpenedAt
          : lastAppOpenedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {this.latitude,
      this.longitude,
      this.destLat,
      this.destLng,
      this.desetName,
      this.lastAppOpenedAt});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? destLat;
  @override
  final double? destLng;
  @override
  final String? desetName;
  @override
  final String? lastAppOpenedAt;

  @override
  String toString() {
    return 'User(latitude: $latitude, longitude: $longitude, destLat: $destLat, destLng: $destLng, desetName: $desetName, lastAppOpenedAt: $lastAppOpenedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.destLat, destLat) || other.destLat == destLat) &&
            (identical(other.destLng, destLng) || other.destLng == destLng) &&
            (identical(other.desetName, desetName) ||
                other.desetName == desetName) &&
            (identical(other.lastAppOpenedAt, lastAppOpenedAt) ||
                other.lastAppOpenedAt == lastAppOpenedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, destLat,
      destLng, desetName, lastAppOpenedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {final double? latitude,
      final double? longitude,
      final double? destLat,
      final double? destLng,
      final String? desetName,
      final String? lastAppOpenedAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double? get destLat;
  @override
  double? get destLng;
  @override
  String? get desetName;
  @override
  String? get lastAppOpenedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
