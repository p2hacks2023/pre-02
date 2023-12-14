import 'package:firebase_tutorial/firestoretest.dart';
import 'package:firebase_tutorial/view/Hiru/hiru.dart';
import 'package:firebase_tutorial/view/Yoru/yoru.dart';
import 'package:firebase_tutorial/view/google_sign_in/signup.dart';
import 'package:firebase_tutorial/view/home.dart';
import 'package:firebase_tutorial/view/post/add_post.dart';
import 'package:firebase_tutorial/view/google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final router = RoutemasterDelegate(
    routesBuilder: (_) => RouteMap(routes: {
          '/': (route) {
            return const MaterialPage(child: GoogleAuthSignin());
          },
          '/signup': (route) {
            return MaterialPage(child: SignUp());
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
          '/yoru': (router) {
            return MaterialPage(child: Yoru());
          },
          //テスト系
          '/test/firestore': (router) {
            return const MaterialPage(child: FireStore());
          },
          '/test/firestore/post/add': (route) {
            return MaterialPage(child: AddPost());
          },
        }));
