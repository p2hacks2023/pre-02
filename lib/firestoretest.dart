import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FireStore extends StatefulWidget {
  const FireStore({super.key});

  @override
  State<FireStore> createState() => _FireStoreState();
}

class _FireStoreState extends State<FireStore> {
  Future<QuerySnapshot<Object?>>? get;
  PostsRepository postsRepository = new PostsRepository();
  @override
  Widget build(BuildContext context) {
    CollectionReference tests = FirebaseFirestore.instance.collection('tests');
    String? getFromFirestore;
    Future<void> addTest() {
      return tests
        .add({
          'name': "aiueo",
          'id' : 1022063,
        })
        .then((value) => print("testadded"))
        .catchError((error) => print("エラーが起きた${error.toString()}"));
    }
    
    return Column(
      children: [
        TextButton(
          onPressed: () => addTest(),
          child: Text("add test"),
        ),
        TextButton(
          onPressed: () async => {
            postsRepository.getAllPosts(),
          },
          child: Text("みる"),
        ),
        if(getFromFirestore != null) Text(getFromFirestore!),
        Consumer(
          builder: (context, ref, child) {
            if(ref.watch(userViewModelProvider).name != null) {
            return TextButton(
              child: Text("add画面に進む"),
              onPressed: () => router.push('post/add'),
            );
            }else {
              return Text("ログインしてください");
            }
          }
        ),
        TextButton(
          onPressed: () => router.pop(),
          child: Text("戻る"),
        )
        /*
        if(get != null) FutureBuilder(
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            }
          }
        ),*/
      ],
    );
  }
}