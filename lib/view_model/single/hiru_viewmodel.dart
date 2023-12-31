
import 'package:firebase_tutorial/model/post.dart';
import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hiru_viewmodel.g.dart';

@riverpod
class HiruViewModel extends _$HiruViewModel{
  late PostsRepository postsRepository;

  @override
  Future<HiruState> build() async{
    postsRepository = PostsRepository();

    return HiruState(
      postsWithoutMe: await postsRepository.getAllPostsWithoutMe(ref.watch(userViewModelProvider).email),
      posts: await postsRepository.getAllPosts(),
      postsOnlyMe: await postsRepository.getAllPostsOnlyMe(ref.watch(userViewModelProvider).email),
    );
  }
  
  Future<void> initializePosts() async {
    PostsRepository postsRepository = PostsRepository();
    debugPrint("initializeposts");
    state = const AsyncLoading();
    List<Post> posts = await postsRepository.getAllPosts();
    state = AsyncData<HiruState> (
      HiruState(
        postsWithoutMe: await postsRepository.getAllPostsWithoutMe(ref.watch(userViewModelProvider).email),
        postsOnlyMe: await postsRepository.getAllPostsOnlyMe(ref.watch(userViewModelProvider).email),
        posts: posts,
      )
    );
    debugPrint("initialize終わった");
  }
}