import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_post_state.freezed.dart';

@freezed
class AddPostState with _$AddPostState {

  factory AddPostState({
    File? file,
    @Default(false) bool uploading,
  }) = _AddPostState;
}