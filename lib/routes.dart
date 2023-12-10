import 'package:firebase_tutorial/main.dart';
import 'package:firebase_tutorial/post/add_post.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final router = RoutemasterDelegate(
  routesBuilder: (_) => RouteMap(
    routes: {
      '/': (route) {
        return MaterialPage(child: AuthPage());
      },
      '/post/add': (route) {
        return MaterialPage(child: AddPost());
      }
    }
  )
);