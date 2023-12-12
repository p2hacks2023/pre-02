import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/model/prePost.dart';
import 'package:flutter/foundation.dart';

class PostsRepository {
  final CollectionReference _postsRef = FirebaseFirestore.instance.collection('posts');
  final FirebaseStorage _storageRef = FirebaseStorage.instance;
  
  Future<List<Post>> getAllPosts() async{
    List<Post> posts = [];
    await _postsRef.orderBy('post_datetime', descending: true).get().then(
      (QuerySnapshot<Object?> querySnapshot) {
        for(var docSnapshot in querySnapshot.docs) {
          posts.add(Post.fromFirestore(docSnapshot));
          Post post = Post.fromFirestore(docSnapshot);
          debugPrint("${post.id}：${post.description}：${post.imageUrl}");
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

  Future<void> addPost(PrePost post, File file, String nickname) async{
    String imagePath;
    DateTime now = DateTime.now();
    imagePath = "${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}_$nickname";
    try{
      await _storageRef.ref(imagePath).putFile(file);
    } on Exception{
      throw Exception("ポストに失敗しました");
    }
    imagePath = "https://storage.googleapis.com/fir-tutorial-52670.appspot.com/$imagePath";
    
    try{
      _postsRef.add({
        'poster': post.poster,
        'description': post.description,
        'image_url': imagePath,
        'favorite_array': [],
        'post_datetime': FieldValue.serverTimestamp(),
      });
    }on Exception{
      throw Exception;
    }
  }
}