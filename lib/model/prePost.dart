//ポスト前のポストデータを扱う
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prePost.freezed.dart';

@freezed
class PrePost with _$PrePost {

  factory PrePost({
    required String poster,
    required String description,
  }) = _PrePost;

}