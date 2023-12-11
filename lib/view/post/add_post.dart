import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPost extends ConsumerWidget{
  String poster = "tiharu717@gmail.com";
  String description = "";
  Uri image_url = Uri.parse("https://takutk.com/obs/img/math/DSC_0685.JPG");
  PostsRepository postsRepository = new PostsRepository();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("add post")),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => description = value,
            decoration: InputDecoration(
              label: Text("テキスト"),
            ),
          ),
          TextButton(
          onPressed: (){
            try{
              postsRepository.addPost(Post(
                poster: poster,
                description: description,
                image_url: image_url,
                post_datetime: DateTime.now()
              ));
            }catch(e){
    
            }
          }, 
          child: Text("投稿する")),
        ],
      ),
    );
  }

}