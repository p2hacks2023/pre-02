import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
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
      appBar: AppBar(title: const Text("aiueo"),),
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
                  TextButton(child: const Text("次に進む"),onPressed: () async { 
                    if(CheckHiruYoru.isHiru()) {
                      await ref.read(hiruViewModelProvider.notifier).initializePosts();
                      await Future.delayed(Duration(seconds: 5));
                      router.replace('/hiru');
                    }
                    if(CheckHiruYoru.isYoru()) router.replace('/yoru');//replaceだと，遷移後戻れなくなる．
                  },),
                  if(!existed) TextButton(
                    child: const Text("ニックネームを設定する"),
                    onPressed: () {
                      ref.watch(googleSignInViewModelProvider);
                      ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(googleSignInAccount!.email, googleSignInAccount!.photoUrl.toString());
                      router.push('/signup');
                    } ,
                  )
                ],
              ),
              TextButton(child: const Text("firestore test"),onPressed: () => router.push('/test/firestore'),)
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

  Future signInWithGoogle(WidgetRef ref) async {
    UsersRepository usersRepository = UsersRepository();
    googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      googleSignInAuthentication = await googleSignInAccount!.authentication;
      setState(() => logined = true);
      ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(googleSignInAccount!.email.toString(), googleSignInAccount!.photoUrl.toString());
      if(await usersRepository.isExisted(googleSignInAccount!.email.toString())) 
      { //すでにユーザーが存在したら
        usersRepository.signin(ref);
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