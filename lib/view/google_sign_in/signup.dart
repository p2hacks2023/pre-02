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
      appBar: AppBar(title: const Text("aiueo"),),
      body: Column(
        children: [
          Material(
            child: TextField(
              decoration: const InputDecoration(label: Text("ニックネーム")),
              onChanged: (value) => nickname = value,
            ),
          ),
          TextButton(
            onPressed: () async {
              GoogleSignInState googleSignInState = ref.watch(googleSignInViewModelProvider);
              await ref.read(userViewModelProvider.notifier).registerUser(googleSignInState.email, googleSignInState.iconUrl.toString(), "", nickname);
              if(CheckHiruYoru.isHiru) {
                router.replace('/hiru');
              }else{
                router.replace('/yoru');
              }
            }, 
            child: const Text("サインアップ"),
          )
        ],
      ),
    );
  }
}