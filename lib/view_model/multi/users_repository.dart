import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersRepository{
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  /*
  Future<void> signUp(String email, String iconUrl, String introduction, String nickname){

  }*/

  ///ユーザーが存在するかのチェック
  Future<bool> isExisted(String email) async{
    bool out = false;
    await userRef.where('email', isEqualTo: email).get().then(
      (querySnapshot) {
        if(querySnapshot.docs.isNotEmpty) out = true;
      }
    );
    return out;
  }
  
  //登録用(サーバーに登録されてない時)
  Future<void> register(String email, String url, String introduction, String nickname)async{
    try{
      userRef.add({
        'email': email,
        'icon_url': url,
        'introduction': introduction,
        'nickname': nickname,
      });
    }on Exception{
      throw Exception("登録に失敗");
    }
  }

  //サインイン
  Future<void> signin(WidgetRef ref) async{
    try{
      User user;
      await userRef.where('email', isEqualTo: ref.watch(googleSignInViewModelProvider).email).get()
      .then((querySnapshot) { 
        user = User.fromFirestore(querySnapshot.docs[0]);
        ref.read(userViewModelProvider.notifier).setUser(user);
      }
      );
    }on Exception{
      throw Exception("サインインに失敗しました");
    }
  }
  
  //自己紹介の変更用
  Future<void> changeIntroduction(WidgetRef ref, String introduction) async {
    try {
      String id = "";
      await userRef.where('email', isEqualTo: ref.watch(googleSignInViewModelProvider).email).get()
      .then((querySnapshot) {
        id = querySnapshot.docs[0].id;
      });
      await userRef.doc(id).update({
        'introduction': introduction,
      });
    }on Exception{
      throw Exception("自己紹介の変更に失敗しました");
    }
  }
}