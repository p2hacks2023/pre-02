import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view/profile/profile.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Hiru extends ConsumerWidget {
  const Hiru({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("昼ビルド");
    return Scaffold(
      /*
      appBar: AppBar(
          title: TextButton(
        child: Text("更新"),
        onPressed: () async =>
            ref.read(hiruViewModelProvider.notifier).initializePosts(),
      )),
      */
      backgroundColor: Color(0xffffffe5),
      body: HiruYoruBase(
        leftTitle: 'TimeLine',
        rightTitle: 'Profile',
        //TimeLineの中身↓
        leftWidget: ref.watch(hiruViewModelProvider).when(
              data: (HiruState data) {
                return ListView.builder(
                  itemCount: data.posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ClipRRect(
                            //投稿写真の上の部分
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Container(
                              width: 130,
                              height: 75,
                              color: Color.fromRGBO(249, 243, 217, 1),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                    //投稿した人のプロフィール写真
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(data
                                        .postsWithoutMe[index].posterIconUrl
                                        .toString()),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    //投稿した人の名前
                                    data.postsWithoutMe[index].nickname,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AspectRatio(
                            //投稿写真
                            aspectRatio: 3 / 4,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(120),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    data.postsWithoutMe[index].imageUrl
                                        .toString())),
                          ),
                          Row(
                            //いいね・日付
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              //月
                              if (data.postsWithoutMe[index].favoriteArray
                                  .contains(
                                      ref.watch(userViewModelProvider).email))
                                Iine(
                                  isFavorite: true,
                                  postId: data.postsWithoutMe[index].id,
                                  email: ref.watch(userViewModelProvider).email,
                                  numOfFavorite: data.postsWithoutMe[index]
                                      .favoriteArray.length,
                                )
                              else
                                Iine(
                                  postId: data.postsWithoutMe[index].id,
                                  email: ref.watch(userViewModelProvider).email,
                                  numOfFavorite: data.postsWithoutMe[index]
                                      .favoriteArray.length,
                                ),
                              SizedBox(
                                width: 150,
                              ),
                              //日付
                              Text(
                                  '${data.postsWithoutMe[index].postDatetime.year.toString()}/'),
                              Text(
                                  '${data.postsWithoutMe[index].postDatetime.month.toString()}/'),
                              Text(
                                  '${data.postsWithoutMe[index].postDatetime.day.toString()}/'),
                              Text(
                                  '${data.postsWithoutMe[index].postDatetime.hour.toString()}:'),
                              Text(
                                  '${data.postsWithoutMe[index].postDatetime.minute.toString()}'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.postsWithoutMe[index].description,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (_, __) => Text("errorが発生"),
              loading: () => const Text("loading"),
            ),
        //Profileの中身↓
        rightWidget: ref.watch(hiruViewModelProvider).when(
              data: (HiruState data) {
                return ListView.builder(
                  itemCount: data.postsOnlyMe.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
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
                                        .toString())),
                          ),
                          //いいね・日付
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
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
                                )
                              else
                                Iine(
                                  postId: data.postsOnlyMe[index].id,
                                  email: ref.watch(userViewModelProvider).email,
                                  numOfFavorite: data
                                      .postsOnlyMe[index].favoriteArray.length,
                                ),
                              SizedBox(
                                width: 150,
                              ),
                              //日付
                              Text(
                                  '${data.postsOnlyMe[index].postDatetime.year.toString()}/'),
                              Text(
                                  '${data.postsOnlyMe[index].postDatetime.month.toString()}/'),
                              Text(
                                  '${data.postsOnlyMe[index].postDatetime.day.toString()}/'),
                              Text(
                                  '${data.postsOnlyMe[index].postDatetime.hour.toString()}:'),
                              Text(
                                  '${data.postsOnlyMe[index].postDatetime.minute.toString()}'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.postsOnlyMe[index].description,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (_, __) => Text("errorが発生"),
              loading: () => const Text("loading"),
            ),
        color: Colors.black,
        image: Uri.parse(
            'https://cdn.discordapp.com/attachments/1181202431116312719/1185187126652960778/42_20231212184157.PNG?ex=658eb286&is=657c3d86&hm=9dc463f9c99dea717a96aae96f4167efc6d6511f180b6cc7db7f95eab3c94848&'),
      ),
    );
  }
}

class Iine extends StatefulWidget {
  late bool isFavorite;
  final postId;
  final email;
  int numOfFavorite;
  Iine(
      {this.isFavorite = false,
      required this.postId,
      required this.email,
      required this.numOfFavorite});

  @override
  _IineState createState() => _IineState();
}

class _IineState extends State<Iine> {
  @override
  Widget build(BuildContext context) {
    Color color;
    if (widget.isFavorite)
      color = Colors.yellow;
    else
      color = Colors.white;
    return Row(
      children: [
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  debugPrint("うえ");
                },
                icon: Icon(Icons.mode_night),
                color: color,
                iconSize: 32),
            Consumer(builder: (context, ref, _) {
              return IconButton(
                onPressed: () async {
                  PostsRepository postsRepository = PostsRepository();
                  debugPrint("下");
                  if (widget.isFavorite) {
                    widget.numOfFavorite--;
                    postsRepository.removeIine(widget.postId, widget.email);
                  } else {
                    widget.numOfFavorite++;
                    postsRepository.addIine(widget.postId, widget.email);
                  }
                  setState(() {
                    widget.isFavorite = !widget.isFavorite;
                  });
                },
                icon: Icon(Icons.mode_night_outlined),
                iconSize: 32,
              );
            })
          ],
        ),
        Text('いいね${widget.numOfFavorite.toString()}件'),
      ],
    );
  }
}
