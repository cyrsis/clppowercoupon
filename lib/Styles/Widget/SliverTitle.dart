import 'package:flutter/material.dart';

////-------- Collapsing Header on iOS styled Flutter App - 8th Feb 2019 -------
void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        platform: TargetPlatform.iOS,
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverTitleBar(
            title: Text('Collapsing Title'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 56.0,
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text('List Item $index',
                      style: Theme.of(context).textTheme.subhead),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SliverTitleBar extends StatelessWidget {
  const SliverTitleBar({
    Key key,
    this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverTitleBarDelegate(
        padding: MediaQuery.of(context).padding,
        expandedHeight: 100.0,
        title: title,
      ),
      pinned: true,
    );
  }
}

class SliverTitleBarDelegate extends SliverPersistentHeaderDelegate {
  SliverTitleBarDelegate({
    this.title,
    this.expandedHeight = 0.0,
    this.padding = EdgeInsets.zero,
  }) : assert(title != null && expandedHeight != null && padding != null);

  final Widget title;
  final double expandedHeight;
  final EdgeInsets padding;

  double get minExtent => kToolbarHeight + padding.top;

  double get maxExtent => minExtent + expandedHeight;

  double get extent => (maxExtent - minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shrinkAmount = (shrinkOffset / extent).clamp(0.0, 1.0);
    final inverseShrinkAmount = 1.0 - Curves.easeIn.transform(shrinkAmount);
    return Stack(
      children: <Widget>[
        AppBar(
          leading: const BackButtonIcon(),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: shrinkAmount,
        ),
        SafeArea(
          child: Container(
            padding: EdgeInsets.only(
                left: 24.0 * inverseShrinkAmount, top: 12.0, bottom: 12.0),
            alignment: Alignment(
              -1.0 * inverseShrinkAmount,
              1.0 * inverseShrinkAmount,
            ),
            child: DefaultTextStyle(
              style: Theme.of(context).primaryTextTheme.title,
              child: title,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverTitleBarDelegate old) => (title != old.title ||
      expandedHeight != old.expandedHeight ||
      padding != old.padding);
}
