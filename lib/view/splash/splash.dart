import 'package:firebase_tutorial/model/user.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                 ref.read(userViewModelProvider.notifier).setUser(
                    User(//デバッグ用
                      nickname: "developer", 
                      email: "developer@developer.com", 
                      iconUrl: Uri.parse('https://logos-download.com/wp-content/uploads/2016/09/GitHub_logo.png'), 
                      introduction: "イントロダクション"
                    ),
                  );
                  if(CheckHiruYoru.isHiru) {
                    router.push('/hiru');
                  }else{
                    router.replace('/yoru');
                  }
                }
              );
            }
          ),
        ],
      ),
    );
  }
}

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