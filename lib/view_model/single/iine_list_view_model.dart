import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/state/iine_list_state.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iine_list_view_model.g.dart';

@Riverpod(keepAlive: true)
class IineListViewModel extends _$IineListViewModel {
  @override
  Future<IineListState> build() async {
    return IineListState(
    );
  }

  Future<void> addFavorites(List<dynamic> favoriteArray) async {
    UsersRepository usersRepository = UsersRepository();
    debugPrint("addfavorites");
    List<User> outputs = [];
    state = const AsyncLoading();
    debugPrint("数は${favoriteArray.length}");
    for(String email in favoriteArray) {
      User user = await usersRepository.getUserFromMailaddress(email);
      outputs.add(user);
    }
    //favoriteArray.forEach(
    //  (element) async { 
    //    debugPrint("favoriteArrayいーち");
    //    outputs.add(await usersRepository.getUserFromMailaddress(element.toString()));
    //  }
    //);
    debugPrint(outputs.length.toString());
    state = AsyncData(IineListState(userList: outputs));
  }
}