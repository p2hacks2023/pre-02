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
                child: ref.watch(profileViewModelProvider).maybeWhen(
                  data: (ProfileState data) => Column(
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
                            data.user!.iconUrl.toString()),
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
                        data.user!.nickname,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                orElse: SizedBox.shrink,
                )
              ),
            
            ];
          },
          body: SizedBox.shrink(),
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