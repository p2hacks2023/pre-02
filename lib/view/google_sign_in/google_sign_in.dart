import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthSignin extends StatefulWidget {
  const GoogleAuthSignin({super.key});

  @override
  State<GoogleAuthSignin> createState() => _GoogleAuthSigninState();
}

class _GoogleAuthSigninState extends State<GoogleAuthSignin> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late GoogleSignInAuthentication googleSignInAuthentication;
  late GoogleSignInAccount? googleSignInAccount;
  
  UsersRepository usersRepository = UsersRepository();
  
  bool logined = false;
  bool existed = false; //登録済みかどうか
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aiueo"),),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, _) {
          return Column(
            children: [
              TextButton(onPressed: ()=> signInWithGoogle(ref), child: const Text("おして")),
              Text(logined.toString()),
              if(logined) Column(
                children: [
                  Text(googleSignInAccount!.displayName.toString()),
                  Image.network(googleSignInAccount!.photoUrl.toString()),
                  const Text("loginされてるねえ"),
                  TextButton(child: Text("次に進む"),onPressed: () { 
                    usersRepository.signin(ref);
                    router.push('/home');
                  },),
                  if(!existed) TextButton(
                    child: Text("ニックネームを設定する"),
                    onPressed: () {
                      ref.watch(googleSignInViewModelProvider);
                      ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(googleSignInAccount!.email, googleSignInAccount!.photoUrl.toString());
                      router.push('/signup');
                    } ,
                  )
                ],
              ),
              TextButton(child: Text("firestore test"),onPressed: () => router.push('/test/firestore'),)
            ],
          );
        }
      ),
    );
  }

  void login(){
    setState(() => logined = true);
  }
  
  void logout() => setState(() => logined = false);

  Future signInWithGoogle(WidgetRef _ref) async {
    UsersRepository usersRepository = UsersRepository();
    googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      googleSignInAuthentication = await googleSignInAccount!.authentication;
      setState(() => logined = true);
      _ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(googleSignInAccount!.email.toString(), googleSignInAccount!.photoUrl.toString());
      if(await usersRepository.isExisted(googleSignInAccount!.email.toString())) 
      { //すでにユーザーが存在したら
        setState(() {
          existed = true;
        });

      }
    }else {
      //ログイン失敗
      debugPrint("aiueo");
    }
  }
}