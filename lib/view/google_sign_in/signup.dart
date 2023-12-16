import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/state/google_sign_in_state.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  UsersRepository usersRepository = UsersRepository();

  String nickname = "";

  SignUp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
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
            width: 380,
            height: 450,
          ),

          Container(
            padding: const EdgeInsets.only(top: 380, left: 75),
            width: 350,
            /*child: Material(
              color: Colors.white,*/
            child: TextField(
              decoration: const InputDecoration(
                labelText: "ニックネーム",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 227, 237, 122),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                      color: Color.fromARGB(255, 227, 237, 122)), // フォーカス時の色
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 227, 237, 122)), // 非フォーカス時の色
                ),
              ),
              style: const TextStyle(
                color: Color.fromARGB(255, 227, 237, 122),
              ),
              onChanged: (value) => nickname = value,
            ),
          ),
          //),

          Container(
            padding: const EdgeInsets.only(top: 600, left: 100),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                    Colors.lightGreen.withOpacity(0.2),
                  ),
                side: MaterialStateProperty.all<BorderSide>(
                 const  BorderSide(
                      color: Color.fromARGB(255, 227, 237, 122),
                      width: 2), // 枠線の色と幅を設定
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                 const  Size(180, 80),
                ),
              ),
              onPressed: () async {
                  GoogleSignInState googleSignInState = ref.watch(googleSignInViewModelProvider);
                  await ref.read(userViewModelProvider.notifier).registerUser(googleSignInState.email, googleSignInState.iconUrl.toString(), "", nickname);
                  if(CheckHiruYoru.isHiru) {
                    router.replace('/hiru');
                  }else{
                    router.replace('/yoru');
                  }
              },
              child: const Text(
                "signup",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 227, 237, 122),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
