import 'package:firebase_tutorial/state/hiru_state.dart';
import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Hiru extends ConsumerWidget {
  const Hiru({super.key});

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
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Image.network(data
                                          .posts[index].posterIconUrl
                                          .toString()),
                                      /*
                                      child: Text(
                                        '写真',
                                        style: TextStyle(fontSize: 12),
                                      ),*/
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    data.posts[index].nickname,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              /*
                              ClipRRect(
                                borderRadius: BorderRadius.circular(120),
                                child: Container(
                                  width: 412.5,
                                  height: 560,
                                  color: Colors.black,
                                ),
                              ),
                            */
                              Column(
                                children: [
                                  /*
                                  SizedBox(
                                    height: 5,
                                  ),
                                  */
                                  AspectRatio(
                                    aspectRatio: 3 / 4,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(120),
                                        child: Image.network(
                                            fit: BoxFit.cover,
                                            data.posts[index].imageUrl
                                                .toString())),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Iine(),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  'いいね${data.posts[index].favoriteArray.length.toString()}件'),
                              SizedBox(
                                width: 150,
                              ),
                              Text('2023/12/12/18:00'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(data.posts[index].description),
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
        rightWidget: Text("右"),
      ),
    );
  }
}

class Iine extends StatefulWidget {
  const Iine({Key? key}) : super(key: key);

  @override
  _IineState createState() => _IineState();
}

class _IineState extends State<Iine> {
  bool isIine = false;
  @override
  Widget build(BuildContext context) {
    Color color;
    if (isIine)
      color = Colors.yellow;
    else
      color = Colors.white;
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              debugPrint("うえ");
            },
            icon: Icon(Icons.mode_night),
            color: color,
            iconSize: 32),
        IconButton(
          onPressed: () {
            debugPrint("下");
            setState(() {
              isIine = !isIine;
            });
          },
          icon: Icon(Icons.mode_night_outlined),
          iconSize: 32,
        )
      ],
    );
  }
}
