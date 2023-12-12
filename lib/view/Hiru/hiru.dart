import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Hiru extends ConsumerWidget {
  const Hiru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("昼ビルド");
    return Scaffold(
      appBar: AppBar(title: TextButton(child: Text("更新"),onPressed: () async => ref.read(hiruViewModelProvider.notifier).initializePosts(),)),
      body: ref.watch(hiruViewModelProvider).when(
        data: (HiruState data) {
          return ListView.builder(
            itemCount: data.posts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(data.posts[index].nickname),
                  Image.network(data.posts[index].imageUrl.toString()),
                  Text(data.posts[index].description),
                ],
              );
            },
          );
        },
        error: (_,__) => Text("errorが発生"), 
        loading: () => const Text("loading"),
      )
    );
  }
}