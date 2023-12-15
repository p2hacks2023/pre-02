import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:firebase_tutorial/view/post/add_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yoru extends ConsumerWidget {
  const Yoru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: HiruYoruBase(
        leftTitle: 'addpost',
        rightTitle: 'Profile',
        leftWidget: AddPost(),
        rightWidget: Text("右"),
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF190831),
      //backgroundColor: Colors.transparent,
    );
  }
}
