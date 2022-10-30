// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'text_control.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextControl _$TextControlFromJson(Map<String, dynamic> json) {
  return _TextControl.fromJson(json);
}

/// @nodoc
mixin _$TextControl {
  String? get toiletListLoadFailText => throw _privateConstructorUsedError;
  String? get toiletListLoadingText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextControlCopyWith<TextControl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextControlCopyWith<$Res> {
  factory $TextControlCopyWith(
          TextControl value, $Res Function(TextControl) then) =
      _$TextControlCopyWithImpl<$Res, TextControl>;
  @useResult
  $Res call({String? toiletListLoadFailText, String? toiletListLoadingText});
}

/// @nodoc
class _$TextControlCopyWithImpl<$Res, $Val extends TextControl>
    implements $TextControlCopyWith<$Res> {
  _$TextControlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toiletListLoadFailText = freezed,
    Object? toiletListLoadingText = freezed,
  }) {
    return _then(_value.copyWith(
      toiletListLoadFailText: freezed == toiletListLoadFailText
          ? _value.toiletListLoadFailText
          : toiletListLoadFailText // ignore: cast_nullable_to_non_nullable
              as String?,
      toiletListLoadingText: freezed == toiletListLoadingText
          ? _value.toiletListLoadingText
          : toiletListLoadingText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextControlCopyWith<$Res>
    implements $TextControlCopyWith<$Res> {
  factory _$$_TextControlCopyWith(
          _$_TextControl value, $Res Function(_$_TextControl) then) =
      __$$_TextControlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? toiletListLoadFailText, String? toiletListLoadingText});
}

/// @nodoc
class __$$_TextControlCopyWithImpl<$Res>
    extends _$TextControlCopyWithImpl<$Res, _$_TextControl>
    implements _$$_TextControlCopyWith<$Res> {
  __$$_TextControlCopyWithImpl(
      _$_TextControl _value, $Res Function(_$_TextControl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toiletListLoadFailText = freezed,
    Object? toiletListLoadingText = freezed,
  }) {
    return _then(_$_TextControl(
      toiletListLoadFailText: freezed == toiletListLoadFailText
          ? _value.toiletListLoadFailText
          : toiletListLoadFailText // ignore: cast_nullable_to_non_nullable
              as String?,
      toiletListLoadingText: freezed == toiletListLoadingText
          ? _value.toiletListLoadingText
          : toiletListLoadingText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TextControl implements _TextControl {
  _$_TextControl({this.toiletListLoadFailText, this.toiletListLoadingText});

  factory _$_TextControl.fromJson(Map<String, dynamic> json) =>
      _$$_TextControlFromJson(json);

  @override
  final String? toiletListLoadFailText;
  @override
  final String? toiletListLoadingText;

  @override
  String toString() {
    return 'TextControl(toiletListLoadFailText: $toiletListLoadFailText, toiletListLoadingText: $toiletListLoadingText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextControl &&
            (identical(other.toiletListLoadFailText, toiletListLoadFailText) ||
                other.toiletListLoadFailText == toiletListLoadFailText) &&
            (identical(other.toiletListLoadingText, toiletListLoadingText) ||
                other.toiletListLoadingText == toiletListLoadingText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, toiletListLoadFailText, toiletListLoadingText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextControlCopyWith<_$_TextControl> get copyWith =>
      __$$_TextControlCopyWithImpl<_$_TextControl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextControlToJson(
      this,
    );
  }
}

abstract class _TextControl implements TextControl {
  factory _TextControl(
      {final String? toiletListLoadFailText,
      final String? toiletListLoadingText}) = _$_TextControl;

  factory _TextControl.fromJson(Map<String, dynamic> json) =
      _$_TextControl.fromJson;

  @override
  String? get toiletListLoadFailText;
  @override
  String? get toiletListLoadingText;
  @override
  @JsonKey(ignore: true)
  _$$_TextControlCopyWith<_$_TextControl> get copyWith =>
      throw _privateConstructorUsedError;
}