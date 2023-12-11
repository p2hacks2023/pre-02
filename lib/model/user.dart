import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required String nickname,
    required String email,
    required Uri iconUrl,
    required String introduction,
  }) = _User;
  
  factory User.fromFirestore(
    DocumentSnapshot<Object?> snapshot,
  ){
    final data = snapshot.data() as Map<String, dynamic>;
    String nickname = data['nickname'];
    String email = data['email'];
    String iconUrl = data['icon_url'];
    String introduction = data['introduction'];

    return User(
      email: email,
      nickname: nickname,
      iconUrl: Uri.parse(iconUrl),
      introduction: introduction,
    );
  }
}