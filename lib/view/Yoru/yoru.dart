import 'package:firebase_tutorial/view/hiru_yoru_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yoru extends ConsumerWidget {
  const Yoru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("aiueo")),
      body: HiruYoruBase(
        leftTitle: 'addpost',
        rightTitle: 'Profile',
        leftWidget: Text("左"),
        rightWidget: Text("右"),
      ),
    );
  }
}
