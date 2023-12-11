import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/post.dart';
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
  PostsRepository postsRepository = PostsRepository();
  @override
  Widget build(BuildContext context) {
    CollectionReference tests = FirebaseFirestore.instance.collection('tests');
    String? getFromFirestore;
    String? formId = "0eOPPDVJikKfA3SEyaYN";
    Post? idFetched;
    
    Future<void> addTest() {
      return tests
        .add({
          'name': "aiueo",
          'id' : 1022063,
        })
        .then((value) => debugPrint("testadded"))
        .catchError((error) => debugPrint("エラーが起きた${error.toString()}"));
    }
    
    return Column(
      children: [
        TextButton(
          onPressed: () => addTest(),
          child: const Text("add test"),
        ),
        TextButton(
          onPressed: () async => {
            postsRepository.getAllPosts(),
          },
          child: const Text("みる"),
        ),
        // ignore: unnecessary_null_comparison
        if(getFromFirestore != null) Text(getFromFirestore),
        Consumer(
          builder: (context, ref, child) {
            // ignore: unnecessary_null_comparison
            if(ref.watch(userViewModelProvider).nickname != null) {
            return TextButton(
              child: const Text("add画面に進む"),
              onPressed: () => router.push('post/add'),
            );
            }else {
              return const Text("ログインしてください");
            }
          }
        ),
        TextButton(
          onPressed: () => router.pop(),
          child: const Text("戻る"),
        ),
        Material(
          child: TextField(
            decoration: const InputDecoration(label: Text("ポストidを入力"),),
            onChanged: ((value) => formId = value),
          ),
        ),
        if(formId != null) TextButton(child: const Text("ポストを見る"),
        onPressed: () => postsRepository.getPost(formId!).then((value) => setState(() => debugPrint(value.description))),
        ),
        // ignore: unnecessary_null_comparison
        if(idFetched != null) Text(idFetched.toString()),
        
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