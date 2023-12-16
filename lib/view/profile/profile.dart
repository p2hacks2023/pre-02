import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/state/profile_state.dart';
import 'package:firebase_tutorial/view_model/multi/posts_repository.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({
    super.key
  });
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
    
                title: Stack(
                  children: [
                    Text(
                      "Strollary",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
    
                        //color: Colors.black,
    
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.white,
                      ),
                    ),
                    Text(
                      "Strollary",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                          child: Consumer(
                        builder: (context, ref, _) => Image.network(
                            ref.watch(userViewModelProvider).iconUrl.toString()),
                      )
                          /*Text(
                          '写真',
                          style: TextStyle(fontSize: 30),
                        ),*/
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer(builder: (context, ref, _) {
                      return Text(
                        ref.watch(userViewModelProvider).nickname,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            
            ];
          },
          body: SizedBox.shrink(),
        ),
    );
  }
  
  Widget aboutMe(User user, BuildContext context, WidgetRef ref){
    String nickname = user.nickname;
    UsersRepository usersRepository = UsersRepository();
    return Column(
      children: [
        Image.network(
          user.iconUrl.toString(),
          height: 150,
          errorBuilder: (context, error, stackTrace) {
            return Text("接続エラー");
          },
        ),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20,),
            Text(
              user.nickname,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                barrierLabel: "ニックネームの変更",
                builder: (context) {
                  return AlertDialog(
                    title: const Text("ニックネームの編集"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          nickname = user.nickname;
                          router.pop();
                        }, 
                        child: const Text("キャンセル")),
                      TextButton(
                        onPressed: () async {
                          await usersRepository.changeNickname(ref, nickname);
                          ref.read(hiruViewModelProvider.notifier).initializePosts();
                          ref.read(profileViewModelProvider.notifier).addUserToProfile(user.email);
                          router.pop();
                        },
                        child: const Text("変更する"),
                      )
                    ],
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) => nickname = value,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        Text(
          user.introduction,
        ),
        Divider(
          color: Colors.black,
        )
      ],
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