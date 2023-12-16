import 'package:firebase_tutorial/firebase_options.dart';
import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/util/checkHiruYoru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:routemaster/routemaster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeData? theme;
  @override
  Widget build(BuildContext context) {
    if (CheckHiruYoru.isYoru()) {
      theme = ThemeData(
          canvasColor: const Color(0xFF190831),
          textTheme: TextTheme(),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF240A4B),
          ));
    } else {
      theme = ThemeData(
        canvasColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE6C949),
        ),
      );
    }
    return MaterialApp.router(
      theme: theme,
      routerDelegate: router,
      routeInformationParser: const RoutemasterParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
