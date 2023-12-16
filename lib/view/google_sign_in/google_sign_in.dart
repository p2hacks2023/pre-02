import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:routemaster/routemaster.dart';

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
      body: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
        return Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/str.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/title.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 390,
              height: 500,
            ),
            /*Container(
              padding: EdgeInsets.only(top: 230, left: 100),
              child: Text(
                'Strorally',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 50,
                )
              )
            ),*/
            Container(
              padding: const EdgeInsets.only(top: 450, left: 105),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    Colors.lightGreen.withOpacity(0.2),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                        color: Color.fromARGB(255, 227, 237, 122),
                        width: 2), // 枠線の色と幅を設定
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                   const Size(180, 80),
                  ),
                ),
                onPressed: () async {
                  signInWithGoogle(ref);
                },
                child: const Text(
                  "signin",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 227, 237, 122),
                  ),
                ),
              ),
            ),
           
          ],
        );
      }),
    );
  }

  Future signInWithGoogle(WidgetRef ref) async {
    UsersRepository usersRepository = UsersRepository();
    try {
      googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        googleSignInAuthentication = await googleSignInAccount!.authentication;
        ref.read(googleSignInViewModelProvider.notifier).setGoogleUser(
            googleSignInAccount!.email.toString(),
            googleSignInAccount!.photoUrl.toString());
        if (await usersRepository
            .isExisted(googleSignInAccount!.email.toString())) {
          //すでにユーザーが存在したら
          await usersRepository.signin(ref);
          if (CheckHiruYoru.isHiru) {
            await ref.read(profileViewModelProvider.notifier).addUserToProfile(ref.watch(userViewModelProvider).email);
            router.replace('/hiru');
          } else {
            Routemaster.of(context).push('/yoru');
          }
        } else {
          await ref.read(profileViewModelProvider.notifier).addUserToProfile(ref.watch(userViewModelProvider).email);
          router.replace('/signup');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
