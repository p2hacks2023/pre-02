import 'dart:io';

import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_post_state.freezed.dart';

@freezed
class AddPostState with _$AddPostState {

  factory AddPostState({
    File? file,
    @Default(false) bool uploading,
    CameraDescription? camera,
  }) = _AddPostState;
}