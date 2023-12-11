import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPost extends ConsumerWidget{
  String poster = "tiharu717@gmail.com";
  String description = "";
  Uri imageUrl = Uri.parse("https://takutk.com/obs/img/math/DSC_0685.JPG");
  PostsRepository postsRepository = PostsRepository();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("add post")),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => description = value,
            decoration: const InputDecoration(
              label: Text("テキスト"),
            ),
          ),
          TextButton(
          onPressed: (){
              postsRepository.addPost(
                Post(
                poster: poster,
                description: description,
                imageUrl: imageUrl,
                postDatetime: DateTime.now()
              ));
          }, 
          child: const Text("投稿する")),
        ],
      ),
    );
  }

}