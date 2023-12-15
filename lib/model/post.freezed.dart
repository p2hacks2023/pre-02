// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Post {
  String get poster => throw _privateConstructorUsedError; //メールアドレスが入ってる
  String get description => throw _privateConstructorUsedError;
  Uri get imageUrl => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  List<dynamic> get favoriteArray => throw _privateConstructorUsedError;
  DateTime get postDatetime => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Uri get posterIconUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String poster,
      String description,
      Uri imageUrl,
      String nickname,
      List<dynamic> favoriteArray,
      DateTime postDatetime,
      String id,
      Uri posterIconUrl});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poster = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? nickname = null,
    Object? favoriteArray = null,
    Object? postDatetime = null,
    Object? id = null,
    Object? posterIconUrl = null,
  }) {
    return _then(_value.copyWith(
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteArray: null == favoriteArray
          ? _value.favoriteArray
          : favoriteArray // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      postDatetime: null == postDatetime
          ? _value.postDatetime
          : postDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterIconUrl: null == posterIconUrl
          ? _value.posterIconUrl
          : posterIconUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String poster,
      String description,
      Uri imageUrl,
      String nickname,
      List<dynamic> favoriteArray,
      DateTime postDatetime,
      String id,
      Uri posterIconUrl});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poster = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? nickname = null,
    Object? favoriteArray = null,
    Object? postDatetime = null,
    Object? id = null,
    Object? posterIconUrl = null,
  }) {
    return _then(_$PostImpl(
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteArray: null == favoriteArray
          ? _value._favoriteArray
          : favoriteArray // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      postDatetime: null == postDatetime
          ? _value.postDatetime
          : postDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterIconUrl: null == posterIconUrl
          ? _value.posterIconUrl
          : posterIconUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$PostImpl implements _Post {
  _$PostImpl(
      {required this.poster,
      required this.description,
      required this.imageUrl,
      required this.nickname,
      required final List<dynamic> favoriteArray,
      required this.postDatetime,
      required this.id,
      required this.posterIconUrl})
      : _favoriteArray = favoriteArray;

  @override
  final String poster;
//メールアドレスが入ってる
  @override
  final String description;
  @override
  final Uri imageUrl;
  @override
  final String nickname;
  final List<dynamic> _favoriteArray;
  @override
  List<dynamic> get favoriteArray {
    if (_favoriteArray is EqualUnmodifiableListView) return _favoriteArray;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteArray);
  }

  @override
  final DateTime postDatetime;
  @override
  final String id;
  @override
  final Uri posterIconUrl;

  @override
  String toString() {
    return 'Post(poster: $poster, description: $description, imageUrl: $imageUrl, nickname: $nickname, favoriteArray: $favoriteArray, postDatetime: $postDatetime, id: $id, posterIconUrl: $posterIconUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality()
                .equals(other._favoriteArray, _favoriteArray) &&
            (identical(other.postDatetime, postDatetime) ||
                other.postDatetime == postDatetime) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterIconUrl, posterIconUrl) ||
                other.posterIconUrl == posterIconUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      poster,
      description,
      imageUrl,
      nickname,
      const DeepCollectionEquality().hash(_favoriteArray),
      postDatetime,
      id,
      posterIconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);
}

abstract class _Post implements Post {
  factory _Post(
      {required final String poster,
      required final String description,
      required final Uri imageUrl,
      required final String nickname,
      required final List<dynamic> favoriteArray,
      required final DateTime postDatetime,
      required final String id,
      required final Uri posterIconUrl}) = _$PostImpl;

  @override
  String get poster;
  @override //メールアドレスが入ってる
  String get description;
  @override
  Uri get imageUrl;
  @override
  String get nickname;
  @override
  List<dynamic> get favoriteArray;
  @override
  DateTime get postDatetime;
  @override
  String get id;
  @override
  Uri get posterIconUrl;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
