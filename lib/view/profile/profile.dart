import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return ref.watch(profileViewModelProvider).maybeWhen(
      data: (data) {
        debugPrint("data"+ data.posts.length.toString());
        return ListView.builder(
          itemBuilder: (BuildContext context, index) => Text(data.posts[index].description),
          itemCount: data.posts.length,
          );
      },
      orElse: () {
        debugPrint("あいうえお");
        return Text("load中　　　　　　　　　　　　　　ーーーーーーーーーーーーーーー");
      }
    );
  }
}