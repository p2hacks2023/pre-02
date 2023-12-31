import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/model/prePost.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
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
  
  //ログインしてるユーザー以外の投稿を見る
  Future<List<Post>> getAllPostsWithoutMe(String email) async {
    List<Post> posts = [];
    await _postsRef.where('poster', isNotEqualTo: email).get().then(
      (QuerySnapshot<Object?> querySnapshot) {
        for(var docSnapshot in querySnapshot.docs) {
          posts.add(Post.fromFirestore(docSnapshot));
        }
      }
    );
    posts.sort((a,b) => b.postDatetime.compareTo(a.postDatetime));
    return posts;
  }
  
  Future<List<Post>> getAllPostsOnlyMe(String email) async{
    List<Post> posts = [];
    await _postsRef.where('poster', isEqualTo: email).get().then(
      (QuerySnapshot<Object?> querySnapshot) {
        for(var docSnapshot in querySnapshot.docs) {
          posts.add(Post.fromFirestore(docSnapshot));
        }
      }
    );
    posts.sort((a,b) => b.postDatetime.compareTo(a.postDatetime));
    return posts;
  }
  
  Future<Post> getPost(String id) async {
    var post = await _postsRef.doc(id).get();
    if (post.exists) return Post.fromFirestore(post);
    
    throw Exception("no post idは：$id");
  }

  Future<void> addPost(PrePost post, File file, String nickname, String iconUrl) async{
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
        'nickname': nickname,
        'poster_icon': iconUrl,
      });
    }on Exception{
      throw Exception;
    }
  }
  //いいね追加
  Future<void> addIine(String postId, String email) async {
    UsersRepository usersRepository = UsersRepository();
    try{
      await _postsRef.doc(postId).update({
        'favorite_array': FieldValue.arrayUnion([email]),
      });
    }on Exception{
      throw Exception("いいねの追加に失敗");
    }
  }
  
  //いいねの削除
  Future<void> removeIine(String postId, String email) async {
    try{
      await _postsRef.doc(postId).update({
        'favorite_array': FieldValue.arrayRemove([email]),
      });
    }on Exception{
      throw Exception("いいねの削除に失敗");
    }
  }
}