import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view/Hiru/hiru.dart';
import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view/post/add_post.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yoru extends ConsumerWidget {
  const Yoru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xff190831),
      body: HiruYoruBase(
        leftTitle: 'Add Post',
        rightTitle: 'My Profile',
        leftWidget: AddPost(),
        rightWidget: ref.watch(hiruViewModelProvider).when(
              data: (HiruState data) {
                return ListView.builder(
                  itemCount: data.postsOnlyMe.length,
                  cacheExtent: 80,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          AspectRatio(
                            //投稿写真
                            aspectRatio: 3 / 4,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(120),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    data.postsOnlyMe[index].imageUrl
                                        .toString()
                                        )),
                          ),            //いいね・日付
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //月
                              if (data.postsOnlyMe[index].favoriteArray
                                  .contains(
                                      ref.watch(userViewModelProvider).email))
                                Iine(
                                  isFavorite: true,
                                  postId: data.postsOnlyMe[index].id,
                                  email: ref.watch(userViewModelProvider).email,
                                  numOfFavorite: data
                                      .postsOnlyMe[index].favoriteArray.length,
                                  users: data.postsOnlyMe[index].favoriteArray,
                                  ref: ref,
                                )
                              else
                                Iine(
                                  ref: ref,
                                  postId: data.postsOnlyMe[index].id,
                                  email: ref.watch(userViewModelProvider).email,
                                  numOfFavorite: data
                                      .postsOnlyMe[index].favoriteArray.length,
                                  users: data.postsOnlyMe[index].favoriteArray,
                                ),
                              //日付
                              Row(
                                children: [
                                  Text(
                                    '${data.postsOnlyMe[index].postDatetime.year.toString()}/',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '${data.postsOnlyMe[index].postDatetime.month.toString()}/',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '${data.postsOnlyMe[index].postDatetime.day.toString()}/',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '${data.postsOnlyMe[index].postDatetime.hour.toString()}:',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    data.postsOnlyMe[index].postDatetime.minute.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )
                                 ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.postsOnlyMe[index].description,
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (_, __) => const Text(
                "errorが発生",
                style: TextStyle(color: Colors.white),
              ),
              loading: () => const Text(
                "loading",
                style: TextStyle(color: Colors.white),
              ),
            ),
        color: Colors.white,
        image: Uri.parse(
          'https://cdn.discordapp.com/attachments/1181202431116312719/1185187126946574416/42_20231215204918.PNG?ex=658eb286&is=657c3d86&hm=e6c6a9b4b5890e96204f40f6539e55e6fa32618455e78d01a130b8a8244b7e57&'
        ),
      ),
      //backgroundColor: Colors.transparent,
    );
  }
}
