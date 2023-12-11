import 'package:firebase_tutorial/state/google_sign_in_state.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/google_sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  UsersRepository usersRepository = UsersRepository();
  
  String nickname = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("aiueo"),),
      body: Column(
        children: [
          Material(
            child: TextField(
              decoration: InputDecoration(label: Text("ニックネーム")),
              onChanged: (value) => nickname = value,
            ),
          ),
          Text(ref.watch(googleSignInViewModelProvider).email!),
          TextButton(
            onPressed: () {
              GoogleSignInState googleSignInState = ref.watch(googleSignInViewModelProvider);
              debugPrint(ref.watch(googleSignInViewModelProvider).email);
              ref.read(userViewModelProvider.notifier).registerUser(googleSignInState.email!, googleSignInState.icon_url.toString(), "", nickname);
            }, 
            child: Text("サインアップ"),
          )
        ],
      ),
    );
  }
}