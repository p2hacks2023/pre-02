import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view/profile/profile.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Hiru extends ConsumerWidget {
  const Hiru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("昼ビルド");
    return Scaffold(
      body: HiruYoruBase(
        leftTitle: "投稿", 
        rightTitle: "profile", 
        leftWidget: Text("投稿"), 
        rightWidget: 
          Profile(),
      ),
    );
  }
}
/*ref.watch(hiruViewModelProvider).when(
        data: (HiruState data) {
          return ListView.builder(
            itemCount: data.posts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(data.posts[index].nickname),
                  CachedNetworkImage(
                    imageUrl: data.posts[index].imageUrl.toString(),
                    progressIndicatorBuilder: (context, url, progress) => Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width * 4/3,),
                  ),
                  Text(data.posts[index].description),
                ],
              );
            },
          );
        },
        error: (_,__) => Text("errorが発生"), 
        loading: () => const Text("loading"),
      )
*/