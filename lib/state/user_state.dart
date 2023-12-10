import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {

  factory UserState({
    String? name,
    String? nickname,
    String? email,
    Uri? iconUrl,
    String? introduction,
  }) = _UserState;

}