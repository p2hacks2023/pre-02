import 'package:firebase_tutorial/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'iine_list_state.freezed.dart';

@freezed
class IineListState with _$IineListState {
  factory IineListState({
    List<User>? userList,
  }) = _IineListState;
}
