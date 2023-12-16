import 'package:firebase_tutorial/view_model/multi/user_view_model.dart';
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
                    return Column(
                      children: [
                        Text(
                          ref.watch(userViewModelProvider).nickname,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ref.watch(userViewModelProvider).introduction,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
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
