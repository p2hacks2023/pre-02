import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FIREBASE"),),
        body: AuthPage(),
      ),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late GoogleSignInAuthentication googleSignInAuthentication;
  late GoogleSignInAccount? googleSignInAccount;
  bool logined = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: ()=> signInWithGoogle(), child: Text("おして")),
        Text(logined.toString()),
        if(logined) Column(
          children: [
            Text(googleSignInAccount!.displayName.toString()),
            Image.network(googleSignInAccount!.photoUrl.toString()),
            const Text("loginされてるねえ"),
          ],
        )
      ],
    );
  }

  void login(){
    setState(() => logined = true);
  }
  
  void logout() => setState(() => logined = false);

  Future signInWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      googleSignInAuthentication = await googleSignInAccount!.authentication;
      setState(() => logined = true);
    }else {
      debugPrint("aiueo");
    }
  }
}

class AuthenticationProvider {
  static Future<User?> signIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleAuthProvider authProvider = GoogleAuthProvider();
    final UserCredential userCredential = 
      await auth.signInWithPopup(authProvider);
    return userCredential.user;
  }
}