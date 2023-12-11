import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class PostsRepository {
  CollectionReference _postsRef = FirebaseFirestore.instance.collection('posts');
  
  Future<List<Post>> getAllPosts() async{
    List<Post> posts = [];
    await _postsRef.orderBy('post_datetime', descending: true).get().then(
      (QuerySnapshot) {
        for(var docSnapshot in QuerySnapshot.docs) {
          //debugPrint(docSnapshot.data().toString() + docSnapshot.id);
          //var data = docSnapshot.data() as Map<String, dynamic>;
          //debugPrint('------------${docSnapshot.id}');
          posts.add(Post.fromFirestore(docSnapshot));
          debugPrint(Post.fromFirestore(docSnapshot).id);
          //data.forEach((key, value) {debugPrint('${key.toString()}：${value.toString()}');});
         //final data = docSnapshot.data() as Map<String, dynamic>;
    
    /*
    List favorite_array = data['favorite_array'] as List;
    debugPrint(favorite_array.length.toString());*/

          /*posts.add(
          Post.fromFirestore(
            docSnapshot, 
            docSnapshot.id
          ));*/
        }
      }
    );
    posts.forEach((element) {
      Post p = element;
      debugPrint(p.id);
    });
    return posts;
  }
  /*
  ///最新のポストから start番目からend番目を取得
  Future<void> getPostBetween(int end, [int start = 0]) {
    List<Post> posts;
    _postsRef.orderBy('post_datetime', descending: true).limit(end).then(
      (QuerySnapshot) {
        
      }
    )
  }*/

  Future<void> addPost(Post _post) async{
    try{
      _postsRef.add({
        'poster': _post.poster,
        'description': _post.description,
        'image_url': _post.image_url.toString(),
        'favorite_array': [],
        //'post_datetime': _post.post_datetime,
        'post_datetime': FieldValue.serverTimestamp(),
      });
    }catch(Exception){
      debugPrint(Exception.toString());
    }
  }
}