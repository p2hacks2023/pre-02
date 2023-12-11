import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/user.dart';

part 'google_sign_in_state.freezed.dart';

@freezed
class GoogleSignInState with _$GoogleSignInState {

  factory GoogleSignInState({
    required String email,
    required String icon_url,
  }) = _GoogleSignInState;

}