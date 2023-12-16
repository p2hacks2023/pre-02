// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iine_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IineListState {
  List<User>? get userList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IineListStateCopyWith<IineListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IineListStateCopyWith<$Res> {
  factory $IineListStateCopyWith(
          IineListState value, $Res Function(IineListState) then) =
      _$IineListStateCopyWithImpl<$Res, IineListState>;
  @useResult
  $Res call({List<User>? userList});
}

/// @nodoc
class _$IineListStateCopyWithImpl<$Res, $Val extends IineListState>
    implements $IineListStateCopyWith<$Res> {
  _$IineListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userList = freezed,
  }) {
    return _then(_value.copyWith(
      userList: freezed == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IineListStateImplCopyWith<$Res>
    implements $IineListStateCopyWith<$Res> {
  factory _$$IineListStateImplCopyWith(
          _$IineListStateImpl value, $Res Function(_$IineListStateImpl) then) =
      __$$IineListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User>? userList});
}

/// @nodoc
class __$$IineListStateImplCopyWithImpl<$Res>
    extends _$IineListStateCopyWithImpl<$Res, _$IineListStateImpl>
    implements _$$IineListStateImplCopyWith<$Res> {
  __$$IineListStateImplCopyWithImpl(
      _$IineListStateImpl _value, $Res Function(_$IineListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userList = freezed,
  }) {
    return _then(_$IineListStateImpl(
      userList: freezed == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc

class _$IineListStateImpl implements _IineListState {
  _$IineListStateImpl({final List<User>? userList}) : _userList = userList;

  final List<User>? _userList;
  @override
  List<User>? get userList {
    final value = _userList;
    if (value == null) return null;
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IineListState(userList: $userList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IineListStateImpl &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_userList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IineListStateImplCopyWith<_$IineListStateImpl> get copyWith =>
      __$$IineListStateImplCopyWithImpl<_$IineListStateImpl>(this, _$identity);
}

abstract class _IineListState implements IineListState {
  factory _IineListState({final List<User>? userList}) = _$IineListStateImpl;

  @override
  List<User>? get userList;
  @override
  @JsonKey(ignore: true)
  _$$IineListStateImplCopyWith<_$IineListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
