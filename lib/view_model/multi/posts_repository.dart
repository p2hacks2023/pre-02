import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:flutter/foundation.dart';

class PostsRepository {
  final CollectionReference _postsRef = FirebaseFirestore.instance.collection('posts');
  
  Future<List<Post>> getAllPosts() async{
    List<Post> posts = [];
    await _postsRef.orderBy('post_datetime', descending: true).get().then(
      (QuerySnapshot<Object?> querySnapshot) {
        for(var docSnapshot in querySnapshot.docs) {
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

  Future<void> addPost(Post post) async{
    try{
      _postsRef.add({
        'poster': post.poster,
        'description': post.description,
        'image_url': post.imageUrl.toString(),
        'favorite_array': [],
        'post_datetime': FieldValue.serverTimestamp(),
      });
    }on Exception{
      throw Exception;
    }
  }
}