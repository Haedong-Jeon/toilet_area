// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'noti.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Noti _$NotiFromJson(Map<String, dynamic> json) {
  return _Noti.fromJson(json);
}

/// @nodoc
mixin _$Noti {
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotiCopyWith<Noti> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotiCopyWith<$Res> {
  factory $NotiCopyWith(Noti value, $Res Function(Noti) then) =
      _$NotiCopyWithImpl<$Res, Noti>;
  @useResult
  $Res call({String? title, String? body, String? payload});
}

/// @nodoc
class _$NotiCopyWithImpl<$Res, $Val extends Noti>
    implements $NotiCopyWith<$Res> {
  _$NotiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotiCopyWith<$Res> implements $NotiCopyWith<$Res> {
  factory _$$_NotiCopyWith(_$_Noti value, $Res Function(_$_Noti) then) =
      __$$_NotiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body, String? payload});
}

/// @nodoc
class __$$_NotiCopyWithImpl<$Res> extends _$NotiCopyWithImpl<$Res, _$_Noti>
    implements _$$_NotiCopyWith<$Res> {
  __$$_NotiCopyWithImpl(_$_Noti _value, $Res Function(_$_Noti) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
    Object? payload = freezed,
  }) {
    return _then(_$_Noti(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Noti implements _Noti {
  _$_Noti({this.title, this.body, this.payload});

  factory _$_Noti.fromJson(Map<String, dynamic> json) => _$$_NotiFromJson(json);

  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? payload;

  @override
  String toString() {
    return 'Noti(title: $title, body: $body, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Noti &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotiCopyWith<_$_Noti> get copyWith =>
      __$$_NotiCopyWithImpl<_$_Noti>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotiToJson(
      this,
    );
  }
}

abstract class _Noti implements Noti {
  factory _Noti(
      {final String? title,
      final String? body,
      final String? payload}) = _$_Noti;

  factory _Noti.fromJson(Map<String, dynamic> json) = _$_Noti.fromJson;

  @override
  String? get title;
  @override
  String? get body;
  @override
  String? get payload;
  @override
  @JsonKey(ignore: true)
  _$$_NotiCopyWith<_$_Noti> get copyWith => throw _privateConstructorUsedError;
}
