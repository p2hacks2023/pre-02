import 'package:firebase_tutorial/routes.dart';
import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
import 'package:firebase_tutorial/view_model/multi/users_repository.dart';
import 'package:firebase_tutorial/view_model/single/hiru_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiruYoruBase extends StatelessWidget {
  const HiruYoruBase({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftWidget,
    required this.rightWidget,
    required this.color,
    required this.image,
  });
  final String leftTitle;
  final String rightTitle;
  final Widget leftWidget;
  final Widget rightWidget;
  final Color color;
  final Uri image;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              floating: true,
              snap: true,
              expandedHeight: 50,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(width: 250, height: 250, image.toString()),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder: (context, ref, _) => CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          ref.watch(userViewModelProvider).iconUrl.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer(builder: (context, ref, _) {
                    String nickname = ref.watch(userViewModelProvider).nickname;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                ref.watch(userViewModelProvider).nickname,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                )
                              ),
                      onPressed: (){
                              showDialog(
                                context: context, 
                                builder: (context) {
                                  UsersRepository usersRepository = UsersRepository();
                                  return AlertDialog(
                                    title: const Text("ニックネームの編集"),
                                    actions: [
                                      TextButton(
                                        child: const Text("キャンセル"),
                                        onPressed: () => router.pop(),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if(nickname != ""){
                                            await usersRepository.changeNickname(ref, nickname);
                                            ref.read(hiruViewModelProvider.notifier).initializePosts();
                                            ref.read(userViewModelProvider.notifier).changeNickname(ref, nickname);
                                            router.pop();
                                          }
                                        }, 
                                        child: const Text("変更する")
                                      ),
                                    ],
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          TextField(
                                            onChanged: (value) => nickname = value,
                                            decoration: InputDecoration(
                                              hintText: nickname,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }, 
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                                ref.watch(userViewModelProvider).introduction
                              ),
           onPressed: () => showDialog(
                                context: context, 
                                builder: (context) {
                                  return Consumer(
                                    builder: (context, ref, _) {
                                      String introduction = ref.watch(userViewModelProvider).introduction;
                                      return AlertDialog(
                                        title: const Text("自己紹介の編集"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              router.pop();
                                            }, 
                                            child: const Text("キャンセル"),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if(introduction != ""){
                                                ref.read(userViewModelProvider.notifier).changeIntroduction(ref, introduction);
                                                router.pop();
                                              }
                                            },
                                            child: const Text("変更する"),
                                          )
                                        ],
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (value) => introduction = value,
                                                decoration: InputDecoration(
                                                  hintText: introduction,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  );
                                }
                              ), 
                            )
                          ],
                        ),
                                              ],
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                  tabBar: TabBar(
                indicator: BoxDecoration(),
                labelColor: color,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text(
                      leftTitle,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Tab(
                    child: Text(
                      rightTitle,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )),
            )
          ];
        },
        body: TabBarView(
          children: [
            leftWidget,
            rightWidget,
          ],
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.transparent,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
