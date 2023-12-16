import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:firebase_tutorial/view_model/single/iine_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    String? mailAddress = "tiharu717@gmail.com";
    return Scaffold(
    appBar: AppBar(title: const Text("Splash"),),
      body: Column(
        children: [
          TextButton(
            child: const Text("ログインに遷移(ここはsplash画面なので，実装後はボタン押さなくても自動で遷移"),
            onPressed: () => router.replace('/signin'),
          ),
          Container(width: MediaQuery.of(context).size.width, height: 20, child: Text("↓は開発者用"), color: Colors.cyan,),
          Consumer(
            builder: (context, ref, _) {
              return TextButton(
                child: const Text("開発者用ログイン"),
                onPressed: () async {
                 ref.read(userViewModelProvider.notifier).setUser(
                    User(//デバッグ用
                      nickname: "developer", 
                      email: "developer@developer.com", 
                      iconUrl: Uri.parse('https://logos-download.com/wp-content/uploads/2016/09/GitHub_logo.png'), 
                      introduction: "イントロダクション"
                    ),
                  );
                  ref.read(hiruViewModelProvider.notifier).initializePosts();
                  if(CheckHiruYoru.isHiru()) {
                    await ref.read(profileViewModelProvider.notifier).addUserToProfile(ref.watch(userViewModelProvider).email);
                    router.push('/hiru');
                  }else{
                    await ref.read(profileViewModelProvider.notifier).addUserToProfile(ref.watch(userViewModelProvider).email);
                    router.replace('/yoru');
                  }
                }
              );
            }
          ),
          TextField(
            onChanged: (value) => mailAddress = value,
          ),
          Consumer(
            builder: (context, ref, _) {
              return TextButton(
                onPressed: () async {
                  await ref.read(profileViewModelProvider.notifier).addUserToProfile(mailAddress!);
                  router.push('/profile');
                }, 
                child: Text("プロフィールを見る")
              );
            }
          ),
          Consumer(
            builder: (context, ref, _) {
              return TextButton(
                onPressed: () {
                  ref.read(iineListViewModelProvider.notifier).addFavorites(
                    [
                      "tiharu717@gmail.com",
                      "developer@developer.com",
                    ]
                  );
                  router.push('/hiru/iinelist');
                },
                child: Text("いいね"),
              );
            },
          )
        ],
      ),
    );
  }
}

