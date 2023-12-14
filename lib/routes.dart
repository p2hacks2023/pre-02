import 'package:firebase_tutorial/firestoretest.dart';
import 'package:firebase_tutorial/view/Hiru/hiru.dart';
import 'package:firebase_tutorial/view/Yoru/yoru.dart';
import 'package:firebase_tutorial/view/google_sign_in/signup.dart';
import 'package:firebase_tutorial/view/home.dart';
import 'package:firebase_tutorial/view/post/add_post.dart';
import 'package:firebase_tutorial/view/google_sign_in/google_sign_in.dart';
import 'package:firebase_tutorial/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final router = RoutemasterDelegate(
    routesBuilder: (_) => RouteMap(routes: {
          '/yoru': (router) {
            return MaterialPage(child: Yoru());
          },
          '/': (route) {
            return const MaterialPage(child: Splash());
          },
          '/signup': (route) {
            return MaterialPage(child: SignUp());
          },
          '/signin': (route) {
            return const MaterialPage(child: GoogleAuthSignin());
          },
          '/post/add': (route) {
            return MaterialPage(child: AddPost());
          },
          '/home': (router) {
            return const MaterialPage(child: Home());
          },
          '/hiru': (router) {
            return const MaterialPage(child: Hiru());
          },
          //テスト系
          '/test/firestore': (router) {
            return const MaterialPage(child: FireStore());
          },
          '/test/firestore/post/add': (route) {
            return MaterialPage(child: AddPost());
          },
        }));
