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
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AuthPage(),
        ),
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool logined = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()=>signInWithGoogle(), child: Text("おして"));
  }

  void login(){
    setState(() => logined = true);
  }
  
  void logout() => setState(() => logined = false);

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication;
    if(googleSignInAccount != null){
      googleSignInAuthentication = await googleSignInAccount.authentication;
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