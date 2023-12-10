import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool logined = false;
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
                  TextButton(child: Text("次に進む"),onPressed: () => router.push('/home'),)
                ],
              )
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
    googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      googleSignInAuthentication = await googleSignInAccount!.authentication;
      setState(() => logined = true);
      _ref.read(userViewModelProvider.notifier).addUser(
        googleSignInAccount!.email.toString(), 
        googleSignInAccount!.photoUrl.toString(), 
        "", googleSignInAccount!.displayName!,
        "");//最後にニックネームを受け取る必要がある
    }else {
      //ログイン失敗
      debugPrint("aiueo");
    }
  }
}