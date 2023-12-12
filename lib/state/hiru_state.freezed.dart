// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hiru_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HiruState {
  List<Post> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiruStateCopyWith<HiruState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiruStateCopyWith<$Res> {
  factory $HiruStateCopyWith(HiruState value, $Res Function(HiruState) then) =
      _$HiruStateCopyWithImpl<$Res, HiruState>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class _$HiruStateCopyWithImpl<$Res, $Val extends HiruState>
    implements $HiruStateCopyWith<$Res> {
  _$HiruStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HiruStateImplCopyWith<$Res>
    implements $HiruStateCopyWith<$Res> {
  factory _$$HiruStateImplCopyWith(
          _$HiruStateImpl value, $Res Function(_$HiruStateImpl) then) =
      __$$HiruStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$HiruStateImplCopyWithImpl<$Res>
    extends _$HiruStateCopyWithImpl<$Res, _$HiruStateImpl>
    implements _$$HiruStateImplCopyWith<$Res> {
  __$$HiruStateImplCopyWithImpl(
      _$HiruStateImpl _value, $Res Function(_$HiruStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$HiruStateImpl(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$HiruStateImpl implements _HiruState {
  _$HiruStateImpl({required final List<Post> posts}) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'HiruState(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HiruStateImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HiruStateImplCopyWith<_$HiruStateImpl> get copyWith =>
      __$$HiruStateImplCopyWithImpl<_$HiruStateImpl>(this, _$identity);
}

abstract class _HiruState implements HiruState {
  factory _HiruState({required final List<Post> posts}) = _$HiruStateImpl;

  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$HiruStateImplCopyWith<_$HiruStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
