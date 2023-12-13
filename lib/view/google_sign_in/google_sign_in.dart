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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Image.network("https://cdn.discordapp.com/attachments/1182963676630753310/1184067727653089321/42_20231212184157.PNG?ex=658aa001&is=65782b01&hm=ce2de4de6d269b8b7b7ef85fd66eea9298eb1443e2d564d4186e13e54ac3ed4f&",height: 250,),
      ),),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, _) {
          return Column(
            children: [
              TextButton(
                onPressed: ()  {
                  signInWithGoogle(ref);
                }, 
                child: const Text("Googleでログイン")
              ),
            ],
          );
        }
      ),
    );
  }

  Future signInWithGoogle(WidgetRef ref) async {
    UsersRepository usersRepository = UsersRepository();
    try{
      googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount != null){
        googleSignInAuthentication = await googleSignInAccount!.authentication;
        ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(googleSignInAccount!.email.toString(), googleSignInAccount!.photoUrl.toString());
        if(await usersRepository.isExisted(googleSignInAccount!.email.toString())) 
        { //すでにユーザーが存在したら
          await usersRepository.signin(ref);
          if(CheckHiruYoru.isHiru()) {
            router.replace('/hiru');
          } else {
            router.replace('/yoru');
          }
        }else{
          router.replace('/signup');
        }
      }
    }catch(e) {
      debugPrint(e.toString());
    } 
  }
}