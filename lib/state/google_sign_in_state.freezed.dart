// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleSignInState {
  String get email => throw _privateConstructorUsedError;
  String get icon_url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleSignInStateCopyWith<GoogleSignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInStateCopyWith<$Res> {
  factory $GoogleSignInStateCopyWith(
          GoogleSignInState value, $Res Function(GoogleSignInState) then) =
      _$GoogleSignInStateCopyWithImpl<$Res, GoogleSignInState>;
  @useResult
  $Res call({String email, String icon_url});
}

/// @nodoc
class _$GoogleSignInStateCopyWithImpl<$Res, $Val extends GoogleSignInState>
    implements $GoogleSignInStateCopyWith<$Res> {
  _$GoogleSignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? icon_url = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      icon_url: null == icon_url
          ? _value.icon_url
          : icon_url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleSignInStateImplCopyWith<$Res>
    implements $GoogleSignInStateCopyWith<$Res> {
  factory _$$GoogleSignInStateImplCopyWith(_$GoogleSignInStateImpl value,
          $Res Function(_$GoogleSignInStateImpl) then) =
      __$$GoogleSignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String icon_url});
}

/// @nodoc
class __$$GoogleSignInStateImplCopyWithImpl<$Res>
    extends _$GoogleSignInStateCopyWithImpl<$Res, _$GoogleSignInStateImpl>
    implements _$$GoogleSignInStateImplCopyWith<$Res> {
  __$$GoogleSignInStateImplCopyWithImpl(_$GoogleSignInStateImpl _value,
      $Res Function(_$GoogleSignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? icon_url = null,
  }) {
    return _then(_$GoogleSignInStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      icon_url: null == icon_url
          ? _value.icon_url
          : icon_url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleSignInStateImpl implements _GoogleSignInState {
  _$GoogleSignInStateImpl({required this.email, required this.icon_url});

  @override
  final String email;
  @override
  final String icon_url;

  @override
  String toString() {
    return 'GoogleSignInState(email: $email, icon_url: $icon_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.icon_url, icon_url) ||
                other.icon_url == icon_url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, icon_url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInStateImplCopyWith<_$GoogleSignInStateImpl> get copyWith =>
      __$$GoogleSignInStateImplCopyWithImpl<_$GoogleSignInStateImpl>(
          this, _$identity);
}

abstract class _GoogleSignInState implements GoogleSignInState {
  factory _GoogleSignInState(
      {required final String email,
      required final String icon_url}) = _$GoogleSignInStateImpl;

  @override
  String get email;
  @override
  String get icon_url;
  @override
  @JsonKey(ignore: true)
  _$$GoogleSignInStateImplCopyWith<_$GoogleSignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
