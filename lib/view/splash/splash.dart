import 'package:firebase_tutorial/routes.dart';
import 'package:flutter/material.dart';

/*class Splash extends StatelessWidget {
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
                  ifers: data.postsOnlyMe[index].favoriteArray,CheckHiruYoru.isHiru()) {
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
          TextButton(child: Text("サインアップ画面に"), onPressed: () => router.push('/signup'),)
        ],
      ),
    );
  }
}*/

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      router..pop().whenComplete(() => router.replace('/signin'));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 80, top: 300),
            child: Image.asset(
              width: 240,
              height: 190,
              'assets/splash.gif',
            ),
          ),
        ],
      ),
    );
  }
}
