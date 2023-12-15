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
  });
  final String leftTitle;
  final String rightTitle;
  final Widget leftWidget;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              //pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 50,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,

              title: Stack(
                children: [
                  Text(
                    "Strollary",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                      //color: Colors.black,

                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.white,
                    ),
                  ),
                  Text(
                    "Strollary",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                        child: Consumer(
                      builder: (context, ref, _) => Image.network(
                          ref.watch(userViewModelProvider).iconUrl.toString()),
                    )
                        /*Text(
                        '写真',
                        style: TextStyle(fontSize: 30),
                      ),*/
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return Text(
                      ref.watch(userViewModelProvider).nickname,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              //floating: true,
              delegate: _StickyTabBarDelegate(
                  tabBar: TabBar(
                indicator: BoxDecoration(),
                labelColor: Colors.black,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Stack(
                      children: [
                        /*
                        Text(
                          leftTitle,
                          style: TextStyle(
                            fontSize: 18,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                          ),
                        ),
                        */
                        Text(
                          leftTitle,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Stack(
                      children: [
                        /*
                        Text(
                          rightTitle,
                          style: TextStyle(
                            fontSize: 18,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                          ),
                        ),
                        */
                        Text(
                          rightTitle,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
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
