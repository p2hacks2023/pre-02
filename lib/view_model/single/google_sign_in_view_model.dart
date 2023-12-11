import 'package:firebase_tutorial/state/google_sign_in_state.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_sign_in_view_model.g.dart';

@Riverpod(keepAlive: true)
class GoogleSignInViewModel extends _$GoogleSignInViewModel {
  @override
  GoogleSignInState build(){
    return GoogleSignInState(
      email: "",
      icon_url: "",
    );
  }
  void setGoogleUser(String email, String url){
    debugPrint("setGoogleUser" + email + url.toString());
    state = GoogleSignInState(email: email, icon_url: url);
  }
  /*
  void addUser(String email, String url, String introduction, String name, String nickname){
    UsersRepository usersRepository = UsersRepository();
    usersRepository.register(email, url, introduction, nickname);
  }*/
  /*
  Future<void> changeIntroduction(String introduction){

  }*/
}
