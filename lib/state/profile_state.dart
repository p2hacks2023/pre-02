import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {

  factory ProfileState({
    User? user,
    @Default(<Post> []) List<Post> posts,
  }) = _ProfileState;

}