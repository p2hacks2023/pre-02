import 'package:flutter/material.dart';

class HiruYoruBase extends StatelessWidget {
  const HiruYoruBase({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftWidget,
    required this.rightWidget,
    required this.color,
  });
  final String leftTitle;
  final String rightTitle;
  final Widget leftWidget;
  final Widget rightWidget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              pinned: true,
              floating: true,
              //collapsedHeight: 56,
              expandedHeight: 80,
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              /*
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'demo',
                  style: TextStyle(color: Colors.black),
                ),
              ),*/
              title: Text(
                "demo",
                style: TextStyle(
                  fontSize: 30,
                color: color,
                ),
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
                    text: leftTitle,
                  ),
                  Tab(
                    text: rightTitle,
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
