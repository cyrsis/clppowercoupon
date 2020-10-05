import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// -----------------------------------------------------------------------------

////-------- Advanced Nav Demo - 7th November 2018 - #HumpdayQandA https://twitter.com/i/status/1060322027993776128 -------
void main() => runApp(NavApp());

class NavApp extends StatefulWidget {
  @override
  NavAppState createState() => NavAppState();
}

class NavAppState extends State<NavApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.pink,
      ),
      home: AdvancecAppBarScaffold(),
    );
  }
}

class AdvancecAppBarScaffold extends StatefulWidget {
  @override
  _AdvancecAppBarScaffoldState createState() => _AdvancecAppBarScaffoldState();
}

class _AdvancecAppBarScaffoldState extends State<AdvancecAppBarScaffold> {
  final _navKey = GlobalKey<NavigatorState>();

  ScreenRoute _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // this is used to paint the NavAppBar above the page content
        // so the drop shadow does not get clipped during transition.
        verticalDirection: VerticalDirection.up,
        children: [
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: WillPopScope(
                onWillPop: () async => !await _navKey.currentState.maybePop(),
                child: Navigator(
                  key: _navKey,
                  observers: [ScreenRouteObserver(_onActiveRouteChanged)],
                  onGenerateRoute: (RouteSettings settings) {
                    return (settings.name=="Some")
//                    return (settings.isInitialRoute)
                        ? ListScreen.route()
                        : null;
                  },
                ),
              ),
            ),
          ),
          NavAppBar(route: _route),
        ],
      ),
    );
  }

  void _onActiveRouteChanged(ScreenRoute route) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _route = route);
    });
  }
}

class ListScreen extends ScreenWidget {
  static Route<dynamic> route() {
    return ScreenRoute(
      title: 'Nav App',
      builder: (BuildContext context) => ListScreen(),
    );
  }

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends ScreenState<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          final title = 'Item #$index';
          return ListTile(
            title: Text(title),
            onTap: () =>
                Navigator.of(context).push(DetailsScreen.route(title, index)),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0);
        },
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
    ];
  }

  @override
  void onPause() {
    super.onPause();
    print('$this.onPause');
  }

  @override
  void onResume() {
    super.onResume();
    print('$this.onResume');
  }
}

class DetailsScreen extends ScreenWidget {
  static Route<dynamic> route(String title, int index) {
    return ScreenRoute(
      title: title,
      builder: (BuildContext context) {
        return DetailsScreen(
          title: title,
          index: index,
        );
      },
    );
  }

  const DetailsScreen({
    Key key,
    @required this.title,
    @required this.index,
  }) : super(key: key);

  final String title;
  final int index;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ScreenState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).push(ListScreen.route()),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: _onActionPressed,
        icon: Icon(IconData(0xe885 + widget.index * 2 + 0,
            fontFamily: 'MaterialIcons')),
      ),
      IconButton(
        onPressed: _onActionPressed,
        icon: Icon(IconData(0xe885 + widget.index * 2 + 1,
            fontFamily: 'MaterialIcons')),
      ),
    ];
  }

  void _onActionPressed() {
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('${widget.title} pressed Action!')),
    );
  }
}

// -----------------------------------------------------------------------------

class NavAppBar extends StatelessWidget {
  const NavAppBar({
    Key key,
    this.route,
  }) : super(key: key);

  final ScreenRoute route;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4.0,
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: IconTheme(
            data: theme.primaryIconTheme,
            child: DefaultTextStyle.merge(
              style: theme.primaryTextTheme.title,
              child: Container(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    Builder(builder: _buildBack),
                    Expanded(
                      child: Builder(builder: _buildTitle),
                    ),
                    Builder(builder: _buildActions),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBack(BuildContext context) {
    return AnimatedSwitcher(
      layoutBuilder: switcherLayoutBuilder(
        alignment: Alignment.centerLeft,
      ),
      transitionBuilder: backIconTransitionBuilder,
      duration: route?.transitionDuration ?? Duration.zero,
      child: (route?.canPop ?? false)
          ? Align(
              alignment: Alignment.centerLeft,
              child: BackButton(),
            )
          : SizedBox(width: 16.0),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final title = route?.title ?? '';
    return AnimatedSwitcher(
      layoutBuilder: switcherLayoutBuilder(
        alignment: Alignment.centerLeft,
      ),
      duration: route?.transitionDuration ?? Duration.zero,
      child: Text(title, key: Key(title)),
    );
  }

  Widget _buildActions(BuildContext context) {
    List<Widget> actions;
    if (route?.actionsBuilder != null) {
      actions = route.actionsBuilder(context);
    }
    return AnimatedSwitcher(
      layoutBuilder: switcherLayoutBuilder(
        alignment: Alignment.centerRight,
      ),
      transitionBuilder: actionTransitionBuilder,
      duration: route?.transitionDuration ?? Duration.zero,
      child: actions != null
          ? Row(
              key: ValueKey(route),
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            )
          : SizedBox(width: 16.0),
    );
  }

  AnimatedSwitcherLayoutBuilder switcherLayoutBuilder({
    AlignmentGeometry alignment = Alignment.center,
    StackFit fit = StackFit.loose,
  }) {
    return (Widget currentChild, List<Widget> previousChildren) {
      List<Widget> children = previousChildren;
      if (currentChild != null) children = children.toList()..add(currentChild);
      return Stack(
        children: children,
        alignment: alignment,
        fit: fit,
      );
    };
  }

  Widget backIconTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        axis: Axis.horizontal,
        axisAlignment: -1.0,
        sizeFactor: animation,
        child: child,
      ),
    );
  }

  Widget actionTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        axisAlignment: 1.0,
        child: child,
      ),
    );
  }
}

// -----------------------------------------------------------------------------

class ScreenRouteObserver extends NavigatorObserver {
  ScreenRouteObserver(this.onActiveRouteChanged);

  final ValueChanged<ScreenRoute> onActiveRouteChanged;

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (route is ScreenRoute) {
      onActiveRouteChanged(route);
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is ScreenRoute) {
      onActiveRouteChanged(previousRoute);
    }
  }
}

typedef ScreenActionsBuilder = List<Widget> Function(BuildContext context);

class ScreenRoute<T> extends MaterialPageRoute<T> {
  static ScreenRoute<T> of<T extends Object>(BuildContext context) {
    final ScreenScope widget = context.ancestorWidgetOfExactType(ScreenScope);
    return widget?.route;
  }

  ScreenRoute({
    @required this.title,
    @required WidgetBuilder builder,
    this.transitionDuration = const Duration(milliseconds: 300),
  }) : super(builder: builder);

  final String title;
  final onPause = ScreenNotifier();
  final onResume = ScreenNotifier();
  ScreenActionsBuilder actionsBuilder;

  @override
  final Duration transitionDuration;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: ScreenScope(
        route: this,
        child: builder(context),
      ),
    );
  }

  @override
  void didChangeNext(Route nextRoute) {
    super.didChangeNext(nextRoute);
    onPause.notifyListeners();
  }

  @override
  void didPopNext(Route nextRoute) {
    super.didPopNext(nextRoute);
    onResume.notifyListeners();
  }

  @override
  String toString() => 'AppRoute{$title}';
}

class ScreenNotifier extends ChangeNotifier {
  // Expose notifyListeners
  @override
  void notifyListeners() => super.notifyListeners();
}

class ScreenScope extends InheritedWidget {
  const ScreenScope({
    Key key,
    @required this.route,
    @required Widget child,
  })  : assert(route != null),
        assert(child != null),
        super(key: key, child: child);

  final ScreenRoute<dynamic> route;

  @override
  bool updateShouldNotify(ScreenScope old) {
    return route != old.route;
  }
}

abstract class ScreenWidget extends StatefulWidget {
  const ScreenWidget({
    Key key,
  }) : super(key: key);

  @override
  ScreenState createState();
}

abstract class ScreenState<T extends ScreenWidget> extends State<T> {
  ScreenRoute _route;

  @override
  void initState() {
    super.initState();
    _route = ScreenRoute.of(context);
    _route.onPause.addListener(onPause);
    _route.onResume.addListener(onResume);
    _route.actionsBuilder = buildActions;
  }

  @protected
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  void dispose() {
    _route.actionsBuilder = null;
    _route?.onResume?.removeListener(onResume);
    _route?.onPause?.removeListener(onPause);
    super.dispose();
  }

  @protected
  @mustCallSuper
  void onResume() {}

  @protected
  @mustCallSuper
  void onPause() {}
}
