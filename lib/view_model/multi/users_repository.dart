import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersRepository{
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  /*
  Future<void> signUp(String email, String iconUrl, String introduction, String nickname){

  }*/

  ///ユーザーが存在するかのチェック
  Future<bool> isExisted(String email) async{
    bool out = false;
    var doc = await userRef.where('email', isEqualTo: email).get().then(
      (QuerySnapshot) {
        if(QuerySnapshot.docs.isNotEmpty) out = true;
      }
    );
    return out;
  }
  
  Future<void> register(String email, String url, String introduction, String nickname)async{
    try{
      userRef.add({
        'email': email,
        'icon_url': url,
        'introduction': introduction,
        'nickname': nickname,
      });
    }catch(Exception){
    }
  }

  Future<void> signin(WidgetRef ref) async{
    try{
      User user;
      await userRef.where('email', isEqualTo: ref.watch(googleSignInViewModelProvider).email).get()
      .then((QuerySnapshot) { 
        user = User.fromFirestore(QuerySnapshot.docs[0]);
        ref.read(userViewModelProvider.notifier).setUser(user);
      }
      );
    }catch(Exception){

    }
  }
  
}