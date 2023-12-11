import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_view_model.g.dart';

@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  User build(){
    return User(
      email: "",
      nickname: "",
      iconUrl: Uri.parse(""),
      introduction: "",
    );
  }

  Future<void> registerUser(String email, String url, String introduction, String nickname)async{
    UsersRepository usersRepository = UsersRepository();
    await usersRepository.register(email, url, introduction, nickname);
    state = User(
      email: email,
      iconUrl: Uri.parse(url),
      introduction: introduction,
      nickname: nickname,
    );
  }
  void setUser(User user){
    state = user;
  }
  /*
  Future<void> changeIntroduction(String introduction){

  }*/
}
