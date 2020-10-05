import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HumpDayQandA 21st',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Title'),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildListDelegate(List.generate(20, (int index) {
                return ListTile(title: Text('Item #$index'));
              })),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: CustomAppBarDelegate(
        child: child,
      ),
    );
  }
}

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomAppBarDelegate({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return SizedBox.expand(
      child: Material(
        color: theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: DefaultTextStyle.merge(
            style: theme.primaryTextTheme.title,
            child: IconTheme.merge(
              data: theme.primaryIconTheme,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => 64.0;

  @override
  double get maxExtent => 120.0;

  @override
  bool shouldRebuild(CustomAppBarDelegate oldDelegate) =>
      child != oldDelegate.child;
}
