import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:flutter/foundation.dart';

class PostsRepository {
  CollectionReference _postsRef = FirebaseFirestore.instance.collection('posts');
  
  Future<void> getAllPosts() async{
    List<Post> posts; 
    _postsRef.get().then(
      (QuerySnapshot) {
        for(var docSnapshot in QuerySnapshot.docs) {
          debugPrint(docSnapshot.data().toString());
        }
      }
    );
  }
  
  Future<void> addPost(Post _post) async{
    try{
      _postsRef.add({
        'name': _post.poster,
        'description': _post.description,
        'image_url': _post.image_url.toString(),
        'favorite_array': [],
        'post_datetime': _post.post_datetime,
      });
    }catch(Exception){
      debugPrint(Exception.toString());
    }
  }
}