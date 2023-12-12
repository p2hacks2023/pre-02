import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Text(ref.watch(userViewModelProvider).nickname),
          Text(ref.watch(userViewModelProvider).introduction),
          TextButton(
            child: const Text("戻る"),
            onPressed: () => router.pop(),
          )
        ],
      ),
    );
  }
}