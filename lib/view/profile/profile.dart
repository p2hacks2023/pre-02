import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/routes.dart';
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
      body: ref.watch(profileViewModelProvider).maybeWhen(
        data: (data) {
          debugPrint("data${data.posts.length}");
          return ListView.builder(
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  Text(data.posts[index].description),
                  Image.network(data.posts[index].imageUrl.toString())
                ],
              );
            },
            itemCount: data.posts.length,
          );
        },
        orElse: () {
          return const CircularProgressIndicator();
        }
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