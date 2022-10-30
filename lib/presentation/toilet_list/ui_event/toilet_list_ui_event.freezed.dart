// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'toilet_list_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToiletListUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoading,
    required TResult Function(String message) onError,
    required TResult Function() onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoading,
    TResult? Function(String message)? onError,
    TResult? Function()? onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoading,
    TResult Function(String message)? onError,
    TResult Function()? onSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoading value) onLoading,
    required TResult Function(OnError value) onError,
    required TResult Function(OnSuccess value) onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoading value)? onLoading,
    TResult? Function(OnError value)? onError,
    TResult? Function(OnSuccess value)? onSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoading value)? onLoading,
    TResult Function(OnError value)? onError,
    TResult Function(OnSuccess value)? onSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToiletListUiEventCopyWith<$Res> {
  factory $ToiletListUiEventCopyWith(
          ToiletListUiEvent value, $Res Function(ToiletListUiEvent) then) =
      _$ToiletListUiEventCopyWithImpl<$Res, ToiletListUiEvent>;
}

/// @nodoc
class _$ToiletListUiEventCopyWithImpl<$Res, $Val extends ToiletListUiEvent>
    implements $ToiletListUiEventCopyWith<$Res> {
  _$ToiletListUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnLoadingCopyWith<$Res> {
  factory _$$OnLoadingCopyWith(
          _$OnLoading value, $Res Function(_$OnLoading) then) =
      __$$OnLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadingCopyWithImpl<$Res>
    extends _$ToiletListUiEventCopyWithImpl<$Res, _$OnLoading>
    implements _$$OnLoadingCopyWith<$Res> {
  __$$OnLoadingCopyWithImpl(
      _$OnLoading _value, $Res Function(_$OnLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnLoading implements OnLoading {
  const _$OnLoading();

  @override
  String toString() {
    return 'ToiletListUiEvent.onLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoading,
    required TResult Function(String message) onError,
    required TResult Function() onSuccess,
  }) {
    return onLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoading,
    TResult? Function(String message)? onError,
    TResult? Function()? onSuccess,
  }) {
    return onLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoading,
    TResult Function(String message)? onError,
    TResult Function()? onSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoading value) onLoading,
    required TResult Function(OnError value) onError,
    required TResult Function(OnSuccess value) onSuccess,
  }) {
    return onLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoading value)? onLoading,
    TResult? Function(OnError value)? onError,
    TResult? Function(OnSuccess value)? onSuccess,
  }) {
    return onLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoading value)? onLoading,
    TResult Function(OnError value)? onError,
    TResult Function(OnSuccess value)? onSuccess,
    required TResult orElse(),
  }) {
    if (onLoading != null) {
      return onLoading(this);
    }
    return orElse();
  }
}

abstract class OnLoading implements ToiletListUiEvent {
  const factory OnLoading() = _$OnLoading;
}

/// @nodoc
abstract class _$$OnErrorCopyWith<$Res> {
  factory _$$OnErrorCopyWith(_$OnError value, $Res Function(_$OnError) then) =
      __$$OnErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OnErrorCopyWithImpl<$Res>
    extends _$ToiletListUiEventCopyWithImpl<$Res, _$OnError>
    implements _$$OnErrorCopyWith<$Res> {
  __$$OnErrorCopyWithImpl(_$OnError _value, $Res Function(_$OnError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OnError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnError implements OnError {
  const _$OnError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ToiletListUiEvent.onError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      __$$OnErrorCopyWithImpl<_$OnError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoading,
    required TResult Function(String message) onError,
    required TResult Function() onSuccess,
  }) {
    return onError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoading,
    TResult? Function(String message)? onError,
    TResult? Function()? onSuccess,
  }) {
    return onError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoading,
    TResult Function(String message)? onError,
    TResult Function()? onSuccess,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoading value) onLoading,
    required TResult Function(OnError value) onError,
    required TResult Function(OnSuccess value) onSuccess,
  }) {
    return onError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoading value)? onLoading,
    TResult? Function(OnError value)? onError,
    TResult? Function(OnSuccess value)? onSuccess,
  }) {
    return onError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoading value)? onLoading,
    TResult Function(OnError value)? onError,
    TResult Function(OnSuccess value)? onSuccess,
    required TResult orElse(),
  }) {
    if (onError != null) {
      return onError(this);
    }
    return orElse();
  }
}

abstract class OnError implements ToiletListUiEvent {
  const factory OnError(final String message) = _$OnError;

  String get message;
  @JsonKey(ignore: true)
  _$$OnErrorCopyWith<_$OnError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSuccessCopyWith<$Res> {
  factory _$$OnSuccessCopyWith(
          _$OnSuccess value, $Res Function(_$OnSuccess) then) =
      __$$OnSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSuccessCopyWithImpl<$Res>
    extends _$ToiletListUiEventCopyWithImpl<$Res, _$OnSuccess>
    implements _$$OnSuccessCopyWith<$Res> {
  __$$OnSuccessCopyWithImpl(
      _$OnSuccess _value, $Res Function(_$OnSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnSuccess implements OnSuccess {
  const _$OnSuccess();

  @override
  String toString() {
    return 'ToiletListUiEvent.onSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoading,
    required TResult Function(String message) onError,
    required TResult Function() onSuccess,
  }) {
    return onSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoading,
    TResult? Function(String message)? onError,
    TResult? Function()? onSuccess,
  }) {
    return onSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoading,
    TResult Function(String message)? onError,
    TResult Function()? onSuccess,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoading value) onLoading,
    required TResult Function(OnError value) onError,
    required TResult Function(OnSuccess value) onSuccess,
  }) {
    return onSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoading value)? onLoading,
    TResult? Function(OnError value)? onError,
    TResult? Function(OnSuccess value)? onSuccess,
  }) {
    return onSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoading value)? onLoading,
    TResult Function(OnError value)? onError,
    TResult Function(OnSuccess value)? onSuccess,
    required TResult orElse(),
  }) {
    if (onSuccess != null) {
      return onSuccess(this);
    }
    return orElse();
  }
}

abstract class OnSuccess implements ToiletListUiEvent {
  const factory OnSuccess() = _$OnSuccess;
}
