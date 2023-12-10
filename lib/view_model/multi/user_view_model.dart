import 'package:firebase_tutorial/state/user_state.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'user_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  UserState build(){
    return UserState();
  }

  void addUser(String email, String url, String introduction, String name, String nickname){
    state = UserState(
      name: name,
      nickname: nickname,
      email: email,
      iconUrl: Uri.parse(url),
      introduction: introduction,
    );
  }
}
