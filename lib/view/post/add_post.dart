import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPost extends ConsumerWidget{
  String description = "";
  Uri imageUrl = Uri.parse("https://cdn.discordapp.com/attachments/1182963676630753310/1182964298058829895/DSC_0049_1.JPG?ex=65869c5b&is=6574275b&hm=0cedc7a9c0583980372b27151cc7f15c2d99fe575bca9800c8c715a737b55e88&G");
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
                poster: ref.watch(userViewModelProvider).email,
                description: description,
                imageUrl: imageUrl,
                postDatetime: DateTime.now()
              ), null);
          }, 
          child: const Text("投稿する")),
        ],
      ),
    );
  }

}