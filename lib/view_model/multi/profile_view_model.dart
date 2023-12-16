import 'package:firebase_tutorial/state/profile_state.dart';
import 'package:firebase_tutorial/view/profile/profile.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProfileViewModel extends _$ProfileViewModel{

  @override
  Future<ProfileState> build() async {
    debugPrint("viewmodelbuildl");
    return ProfileState();
  }
  
  Future<void> addUserToProfile(String poster) async{
    debugPrint("adduser");
    UsersRepository usersRepository = UsersRepository();
    PostsRepository postsRepository = PostsRepository();
    state = const AsyncLoading<ProfileState>();
    state = AsyncData<ProfileState>(
      ProfileState(
        user: await usersRepository.getUserFromMailaddress(poster),
        posts: await postsRepository.getAllPostsOnlyMe(poster),
      )
    );
    debugPrint("セット完了");
  }
}