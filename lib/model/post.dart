import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {

  factory Post({
    required String poster,
    required String description,
    required Uri image_url,
    List? favorite_array,
    DateTime? post_datetime,
    String? id,
  }) = _Post;
  
  factory Post.fromFirestore(
    DocumentSnapshot<Object?> snapshot,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;
    String poster = data['poster'];
    if(poster == null || poster == '') throw Exception("invalid poster");
    String description = data['description'];
    Uri url = Uri.parse(data['image_url']);
    
    //TODO favoriteの実装
    List favorites = data['favorite_array'] as List;

    Timestamp post_timestamp = data['post_datetime'];
    DateTime _post_datetime = post_timestamp.toDate();

    //_post_datetime = data?['post_datetime'].toDate();
    _post_datetime = DateTime.now();
    debugPrint("fromfirestore");

    return Post(
      poster: poster,
      description: description,
      image_url: url,
      favorite_array: favorites,
      post_datetime: _post_datetime,
      id: snapshot.id,
    );
  }
  
  /*
  Map<String, dynamic> toFirestore() {
    return {
      if (poster != null) "poster": poster,
      if (description != null) "description": description,
      if (favorite_array != null) "favorite_array": favorite_array,
      if (image_url != null) "capital": image_url,
      if (post_datetime != null) "population": post_datetime,
    };
  }*/
  
  @override
  String toString() {
    return 'YourClassName(poster: $poster, description: $description, image_url: $image_url, post_datetime: ${post_datetime?.toIso8601String()}, id: $id)';
  }
}