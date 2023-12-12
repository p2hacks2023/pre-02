import 'package:firebase_tutorial/model/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hiru_state.freezed.dart';

@freezed
class HiruState with _$HiruState {

  factory HiruState({
    required List<Post> posts,
  }) = _HiruState;

}