import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/firebase_options.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router,
      routeInformationParser: const RoutemasterParser(),
    );
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