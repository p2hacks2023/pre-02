// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPostState {
  File? get file => throw _privateConstructorUsedError;
  bool get uploading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPostStateCopyWith<AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostStateCopyWith<$Res> {
  factory $AddPostStateCopyWith(
          AddPostState value, $Res Function(AddPostState) then) =
      _$AddPostStateCopyWithImpl<$Res, AddPostState>;
  @useResult
  $Res call({File? file, bool uploading});
}

/// @nodoc
class _$AddPostStateCopyWithImpl<$Res, $Val extends AddPostState>
    implements $AddPostStateCopyWith<$Res> {
  _$AddPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? uploading = null,
  }) {
    return _then(_value.copyWith(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPostStateImplCopyWith<$Res>
    implements $AddPostStateCopyWith<$Res> {
  factory _$$AddPostStateImplCopyWith(
          _$AddPostStateImpl value, $Res Function(_$AddPostStateImpl) then) =
      __$$AddPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? file, bool uploading});
}

/// @nodoc
class __$$AddPostStateImplCopyWithImpl<$Res>
    extends _$AddPostStateCopyWithImpl<$Res, _$AddPostStateImpl>
    implements _$$AddPostStateImplCopyWith<$Res> {
  __$$AddPostStateImplCopyWithImpl(
      _$AddPostStateImpl _value, $Res Function(_$AddPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? uploading = null,
  }) {
    return _then(_$AddPostStateImpl(
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      uploading: null == uploading
          ? _value.uploading
          : uploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddPostStateImpl implements _AddPostState {
  _$AddPostStateImpl({this.file, this.uploading = false});

  @override
  final File? file;
  @override
  @JsonKey()
  final bool uploading;

  @override
  String toString() {
    return 'AddPostState(file: $file, uploading: $uploading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPostStateImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, uploading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPostStateImplCopyWith<_$AddPostStateImpl> get copyWith =>
      __$$AddPostStateImplCopyWithImpl<_$AddPostStateImpl>(this, _$identity);
}

abstract class _AddPostState implements AddPostState {
  factory _AddPostState({final File? file, final bool uploading}) =
      _$AddPostStateImpl;

  @override
  File? get file;
  @override
  bool get uploading;
  @override
  @JsonKey(ignore: true)
  _$$AddPostStateImplCopyWith<_$AddPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
