import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class PostsRepository {
  final CollectionReference _postsRef = FirebaseFirestore.instance.collection('posts');
  
  Future<List<Post>> getAllPosts() async{
    List<Post> posts = [];
    await _postsRef.orderBy('post_datetime', descending: true).get().then(
      (QuerySnapshot) {
        for(var docSnapshot in QuerySnapshot.docs) {
          posts.add(Post.fromFirestore(docSnapshot));
          debugPrint(Post.fromFirestore(docSnapshot).id);
        }
      }
    );
    return posts;
  }
  
  Future<Post> getPost(String id) async {
    var post = await _postsRef.doc(id).get();
    if (post.exists) return Post.fromFirestore(post);
    
    throw Exception("no post idは：$id");
  }

  Future<void> addPost(Post _post) async{
    try{
      _postsRef.add({
        'poster': _post.poster,
        'description': _post.description,
        'image_url': _post.image_url.toString(),
        'favorite_array': [],
        'post_datetime': FieldValue.serverTimestamp(),
      });
    }catch(Exception){
      throw Exception;
    }
  }
}