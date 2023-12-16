import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view/google_sign_in/google_sign_in.dart';
import 'package:firebase_tutorial/view_model/multi/profile_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:firebase_tutorial/view_model/single/iine_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    Future.delayed(Duration(seconds: 5), () {
      router..pop().whenComplete(() => router.replace('/signin'));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 80, top: 300),
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

/*
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:  
          Container(
            padding: EdgeInsets.only(left:20),
            child: Image.asset(
              'assets/splash.gif',
              fit: BoxFit.cover,
            ),
          ),
        
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      nextScreen: ,
      splashIconSize: 300,
      duration: 4000,
    );
  }
}
*/

/*
class Iine extends StatefulWidget {
  const Iine({super.key});

  @override
  State<Iine> createState() => _IineState();
}

class _IineState extends State<Iine> {
  bool isIine = false;
  @override
  Widget build(BuildContext context) {
    Color color ;
    if (isIine) color = Colors.red;
    else color = Colors.black12;
    return IconButton(
      onPressed: () => setState(() {
      isIine = !isIine;
    }), 
    icon: Icon(Icons.favorite, color:color));
  }
}*/

