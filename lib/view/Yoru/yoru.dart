import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yoru extends ConsumerWidget {
  const Yoru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xff190831),
      body: HiruYoruBase(
        leftTitle: 'addpost',
        rightTitle: 'Profile',
        leftWidget: Text("左"),
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
                                '${data.postsOnlyMe[index].postDatetime.year.toString()}/',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${data.postsOnlyMe[index].postDatetime.month.toString()}/',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${data.postsOnlyMe[index].postDatetime.day.toString()}/',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${data.postsOnlyMe[index].postDatetime.hour.toString()}:',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${data.postsOnlyMe[index].postDatetime.minute.toString()}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            data.postsOnlyMe[index].description,
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
              error: (_, __) => Text(
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
            'https://cdn.discordapp.com/attachments/1181202431116312719/1185187126946574416/42_20231215204918.PNG?ex=658eb286&is=657c3d86&hm=e6c6a9b4b5890e96204f40f6539e55e6fa32618455e78d01a130b8a8244b7e57&'),
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
        Text(
          'いいね${widget.numOfFavorite.toString()}件',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
