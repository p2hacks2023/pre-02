import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_sign_in_state.freezed.dart';

@freezed
class GoogleSignInState with _$GoogleSignInState {

  factory GoogleSignInState({
    required String email,
    required String iconUrl,
  }) = _GoogleSignInState;

}