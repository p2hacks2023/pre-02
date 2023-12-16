import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String poster, //メールアドレスが入ってる
    required String description,
    required Uri imageUrl,
    required String nickname,
    required List favoriteArray,
    required DateTime postDatetime,
    required String id,
    required Uri posterIconUrl,
  }) = _Post;

  factory Post.fromFirestore(
    DocumentSnapshot<Object?> snapshot,
  ){
    final data = snapshot.data() as Map<String, dynamic>;
    String poster = data['poster'];
    if (poster == '') throw Exception("invalid poster");
    String description = data['description'];
    Uri url = Uri.parse(data['image_url']);
    String nickname = data['nickname'];
    List favorites = data['favorite_array'] as List;

    Timestamp postTimestamp = data['post_datetime'];
    DateTime postDatetime = postTimestamp.toDate();

    //_post_datetime = data?['post_datetime'].toDate();
    debugPrint("fromfirestore");
    Uri posterIconUrl = Uri.parse(data['poster_icon']);

    return Post(
      nickname: nickname,
      poster: poster,
      description: description,
      imageUrl: url,
      favoriteArray: favorites,
      postDatetime: postDatetime,
      id: snapshot.id,
      posterIconUrl: posterIconUrl,
    );
  }
}
