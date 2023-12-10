import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {

  factory Post({
    required String poster,
    required String description,
    required Uri image_url,
    List<String>? favorite_array,
    required DateTime post_datetime,
  }) = _Post;
  
  factory Post.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    String poster = data?['poster'];
    if(poster == null || poster == '') throw Exception("invalid poster");
    String description = data?['description'];
    if(description == null) description = '';
    Uri url  = Uri.parse(data?['image_url']);
    List<String> favorite_array = data?['favorite_array'];

    return Post(
      poster: poster,
      description: description,
      image_url: url,
      favorite_array: favorite_array,
      post_datetime: data?['post_datetime'],
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
}