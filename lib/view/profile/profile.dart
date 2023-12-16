import 'package:firebase_tutorial/state/profile_state.dart';
import 'package:firebase_tutorial/view/Hiru/hiru.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              //pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 50,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,

              title: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      width: 250,
                      height: 250,
                      'https://cdn.discordapp.com/attachments/1181202431116312719/1185187126652960778/42_20231212184157.PNG?ex=658eb286&is=657c3d86&hm=9dc463f9c99dea717a96aae96f4167efc6d6511f180b6cc7db7f95eab3c94848&'),
                ],
              ),
            ),
          ];
        },
        body: ref.watch(profileViewModelProvider).maybeWhen(
              data: (ProfileState data) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.posts.length,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      if (index == 0)
                        Center(
                          child: Consumer(
                            builder: (context, ref, _) => CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                  data.posts[index].posterIconUrl.toString()),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (index == 0)
                        Consumer(builder: (context, ref, _) {
                          return Text(
                            data.posts[index].nickname,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          );
                        }),
                      const SizedBox(
                        height: 10,
                      ),
                      if(index == 0) Text(
                          data.user!.introduction,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                                      data.posts[index].imageUrl.toString())),
                            ),
                            //いいね・日付
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //月
                                if (data.posts[index].favoriteArray.contains(
                                    ref.watch(userViewModelProvider).email))
                                  Iine(
                                    isFavorite: true,
                                    postId: data.posts[index].id,
                                    email:
                                        ref.watch(userViewModelProvider).email,
                                    numOfFavorite:
                                        data.posts[index].favoriteArray.length,
                                    ref: ref,
                                    users: data.posts[index].favoriteArray,
                                  )
                                else
                                  Iine(
                                    postId: data.posts[index].id,
                                    email:
                                        ref.watch(userViewModelProvider).email,
                                    numOfFavorite:
                                        data.posts[index].favoriteArray.length,
                                    ref: ref,
                                    users: data.posts[index].favoriteArray,
                                  ),

                                //日付
                                Row(
                                  children: [
                                    Text(
                                        '${data.posts[index].postDatetime.year.toString()}/'),
                                    Text(
                                        '${data.posts[index].postDatetime.month.toString()}/'),
                                    Text(
                                        '${data.posts[index].postDatetime.day.toString()}/'),
                                    Text(
                                        '${data.posts[index].postDatetime.hour.toString()}:'),
                                    Text(
                                        data.posts[index].postDatetime.minute.toString()),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data.posts[index].description,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              orElse: SizedBox.shrink,
            ),
      ),
    );
  }
}
