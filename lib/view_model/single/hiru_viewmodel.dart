
import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hiru_viewmodel.g.dart';

@riverpod
class HiruViewModel extends _$HiruViewModel{
  @override
  Future<HiruState> build() async{
    return HiruState(
      posts: [],
    );
  }
  
  Future<void> initializePosts() async {
    PostsRepository postsRepository = PostsRepository();
    debugPrint("initializeposts");
    state = AsyncLoading();
    List<Post> posts = await postsRepository.getAllPosts();
    posts.forEach((element) {debugPrint("こんにちは：element.description");});
    state = AsyncData<HiruState> (
      HiruState(
        posts: posts,
      )
    );
    debugPrint("initialize終わった");
    /*
    state = AsyncData(HiruState(posts: []));
    state.when( //データの時
      data: (HiruState data) async {
        debugPrint("data");
        state = const AsyncLoading();
        List<Post> posts = await postsRepository.getAllPosts();
        posts.forEach((element) {debugPrint("aaaueo" + element.description);});
        state = AsyncData(data.copyWith(posts: posts));
        //state = AsyncData(data.copyWith(posts: await postsRepository.getAllPosts()));
      },
      loading: () => debugPrint("loading"),
      error: (_,__ ) => debugPrint("error"),
    );*/
  }
}