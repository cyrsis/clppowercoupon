////Demonstrate how to change the AppBar from within a PageView.
//
//import 'package:flutter/material.dart';
//
//void main() => runApp(TestApp());
//
//class TestApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primaryColor: Colors.green[900],
//        scaffoldBackgroundColor: Colors.grey[200],
//      ),
//      home: MainScreen(),
//    );
//  }
//}
//
//class AppBarParams {
//  final Widget title;
//  final List<Widget> actions;
//  final Color backgroundColor;
//
//  AppBarParams({
//    this.title,
//    this.actions,
//    this.backgroundColor,
//  });
//}
//
//class MainScreen extends StatefulWidget {
//  final int initialPage;
//
//  const MainScreen({
//    Key key,
//    this.initialPage = 0,
//  }) : super(key: key);
//
//  @override
//  MainScreenState createState() => MainScreenState();
//
//  static MainScreenState of(BuildContext context) {
//    return context.ancestorStateOfType(TypeMatcher<MainScreenState>());
//  }
//}
//
//class MainScreenState extends State<MainScreen> {
//  final List<GlobalKey<MainPageStateMixin>> _pageKeys = [
//    GlobalKey(),
//    GlobalKey(),
//    GlobalKey(),
//  ];
//
//  PageController _pageController;
//  AppBarParams _params;
//  int _page;
//
//  set params(AppBarParams value) {
//    setState(() => _params = value);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _page = widget.initialPage ?? 0;
//    _pageController = PageController(initialPage: _page);
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _pageKeys[0].currentState.onPageVisible();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: _params?.title,
//        actions: _params?.actions,
//        backgroundColor: _params?.backgroundColor,
//      ),
//      body: PageView(
//        controller: _pageController,
//        onPageChanged: _onPageChanged,
//        children: <Widget>[
//          PeoplePage(key: _pageKeys[0]),
//          TimelinePage(key: _pageKeys[1]),
//          StatsPage(key: _pageKeys[2]),
//        ],
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _page,
//        onTap: _onBottomNavItemPressed,
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            title: Text('people'),
//            icon: Icon(Icons.people),
//          ),
//          BottomNavigationBarItem(
//            title: Text('timeline'),
//            icon: Icon(Icons.history),
//          ),
//          BottomNavigationBarItem(
//            title: Text('stats'),
//            icon: Icon(Icons.pie_chart),
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  void reassemble() {
//    super.reassemble();
//    _onPageChanged(_page);
//  }
//
//  void _onPageChanged(int page) {
//    setState(() => _page = page);
//    _pageKeys[_page].currentState.onPageVisible();
//  }
//
//  void _onBottomNavItemPressed(int index) {
//    setState(() => _page = index);
//    _pageController.animateToPage(
//      index,
//      duration: Duration(milliseconds: 400),
//      curve: Curves.fastOutSlowIn,
//    );
//  }
//}
//
//abstract class MainPageStateMixin<T extends StatefulWidget> extends State<T> {
//  void onPageVisible();
//}
//
//class PeoplePage extends StatefulWidget {
//  const PeoplePage({Key key}) : super(key: key);
//
//  @override
//  PeoplePageState createState() => PeoplePageState();
//}
//
//class PeoplePageState extends State<PeoplePage> with MainPageStateMixin {
//  final List<Color> _colors = [
//    Colors.orange,
//    Colors.purple,
//    Colors.green,
//  ];
//
//  int _personCount = 3;
//
//  @override
//  void onPageVisible() {
//    MainScreen.of(context).params = AppBarParams(
//      title: Text('People'),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.person_add),
//          onPressed: () => setState(() => _personCount++),
//        ),
//      ],
//      backgroundColor: Colors.green,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemCount: _personCount,
//      itemBuilder: (BuildContext context, int index) {
//        return Card(
//          child: InkWell(
//            onTap: () => _onTapCard(index),
//            child: Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Material(
//                    type: MaterialType.circle,
//                    color: _colors[index % _colors.length],
//                    child: Container(
//                      width: 48.0,
//                      height: 48.0,
//                      alignment: Alignment.center,
//                      child:
//                          Text('$index', style: TextStyle(color: Colors.white)),
//                    ),
//                  ),
//                  SizedBox(width: 16.0),
//                  Text(
//                    'Item #$index',
//                    style: TextStyle(
//                      color: Colors.grey[600],
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        );
//      },
//    );
//  }
//
//  void _onTapCard(int index) {
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Item #$index')));
//  }
//}
//
//class TimelinePage extends StatefulWidget {
//  const TimelinePage({Key key}) : super(key: key);
//
//  @override
//  TimelinePageState createState() => TimelinePageState();
//}
//
//class TimelinePageState extends State<TimelinePage> with MainPageStateMixin {
//  @override
//  void onPageVisible() {
//    MainScreen.of(context).params = AppBarParams(
//      title: Text('Timeline'),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.alarm_add),
//          onPressed: () {},
//        ),
//      ],
//      backgroundColor: Colors.purple,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Text('Coming soon'),
//    );
//  }
//}
//
//class StatsPage extends StatefulWidget {
//  const StatsPage({Key key}) : super(key: key);
//
//  @override
//  StatsPageState createState() => StatsPageState();
//}
//
//class StatsPageState extends State<StatsPage> with MainPageStateMixin {
//  @override
//  void onPageVisible() {
//    MainScreen.of(context).params = AppBarParams(
//      title: Text('Stats'),
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.add_box),
//          onPressed: () {},
//        ),
//      ],
//      backgroundColor: Colors.orange,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Text('Coming soon'),
//    );
//  }
//}
