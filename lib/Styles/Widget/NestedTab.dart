import 'package:flutter/material.dart';

////-------- Example Nested Tab Layout - 17th Feburary 2019 -------
void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Nested Tab Layout',
      theme: ThemeData(
        primaryColor: const Color(0xFF19507C),
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  final tabs = <Tab>[
    Tab(text: 'HOME'),
    Tab(text: 'DAUERBRENNER'),
  ];

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      drawer: Drawer(),
      title: Text('Title'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      tabs: tabs,
      headerContentAspectRatio: 0.5,
      headerBuilder: (BuildContext context) => PageHeader(),
      tabBuilder: (BuildContext context, int tab) {
        return RefreshIndicator(
          onRefresh: () => _onRefreshTab(tab),
          child: ListView.separated(
            key: PageStorageKey<int>(tab),
            padding: EdgeInsets.zero,
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return TabListItem(
                when: DateTime.now(),
                text: '${tabText(tab)} $index',
                onTap: () => _onTapItem(tab, index),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 2.0, color: Colors.grey);
            },
          ),
        );
      },
    );
  }

  String tabText(int tab) => tabs[tab].text;

  void _onTapItem(int tab, int index) {
    print('tapped $index on tab ${tabText(tab)}');
  }

  Future<void> _onRefreshTab(int tab) async {
    print('refreshing tab ${tabText(tab)}');
    await Future.delayed(const Duration(seconds: 1));
  }
}

class TabListItem extends StatelessWidget {
  const TabListItem({
    Key key,
    @required this.when,
    @required this.text,
    this.onTap,
  })  : assert(when != null && text != null),
        super(key: key);

  final DateTime when;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Placeholder(
                color: Colors.grey[300],
                strokeWidth: 1.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      MaterialLocalizations.of(context).formatFullDate(when),
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(text),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.green[600],
                Colors.green[900],
              ],
            ),
          ),
          child: Placeholder(color: Colors.white24),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.red[600],
                Colors.red[900],
              ],
            ),
          ),
          child: Placeholder(color: Colors.white24),
        ),
      ],
    );
  }
}

class PageLayout extends StatelessWidget {
  const PageLayout({
    Key key,
    this.drawer,
    this.title,
    this.actions,
    this.headerBuilder,
    this.headerContentAspectRatio = 0.0,
    @required this.tabs,
    @required this.tabBuilder,
    this.initialIndex = 0,
  })  : assert(headerContentAspectRatio != null),
        assert(tabs != null && tabBuilder != null && initialIndex != null),
        super(key: key);

  final Widget drawer;
  final Widget title;
  final List<Widget> actions;
  final WidgetBuilder headerBuilder;
  final double headerContentAspectRatio;
  final List<Tab> tabs;
  final IndexedWidgetBuilder tabBuilder;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      body: DefaultTabController(
        initialIndex: initialIndex,
        length: tabs.length,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                final mediaQuery = MediaQuery.of(context);
                final flexibleContentHeight =
                    (constraints.maxWidth * headerContentAspectRatio);
                final kTabWithIndicatorHeight = 48.0;
                final expandedHeight = kToolbarHeight +
                    flexibleContentHeight +
                    kTabWithIndicatorHeight;
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    centerTitle: true,
                    forceElevated: innerBoxIsScrolled,
                    title: title,
                    actions: actions,
                    bottom: TabBar(
                      tabs: tabs,
                    ),
                    expandedHeight:
                        headerBuilder != null ? expandedHeight : null,
                    flexibleSpace: headerBuilder != null
                        ? Column(
                            children: <Widget>[
                              SizedBox(
                                  height:
                                      mediaQuery.padding.top + kToolbarHeight),
                              Expanded(
                                child: ClipRect(
                                  child: OverflowBox(
                                    minHeight: flexibleContentHeight,
                                    maxHeight: flexibleContentHeight,
                                    alignment: Alignment.bottomCenter,
                                    child: headerBuilder?.call(context),
                                  ),
                                ),
                              ),
                              SizedBox(height: kTabWithIndicatorHeight),
                            ],
                          )
                        : null,
                  ),
                ];
              },
              body: TabBarView(
                children: List.generate(tabs.length, (int tab) {
                  return tabBuilder(context, tab);
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
