import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../AppStyleExport.dart';

void main() => runApp(TwitterFab());

class TwitterFab extends StatefulWidget {
  @override
  _TwitterFabState createState() => _TwitterFabState();
}

class _TwitterFabState extends State<TwitterFab>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppWidget.AppBarEmpty,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () => controller.index = 0),
                ),
                Expanded(
                  child: IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () => controller.index = 1),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: controller, children: [
          Center(
            child: Text("Page 1"),
          ),
          Center(
            child: Text("Page 2"),
          ),
        ]),
        floatingActionButton: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final tween = TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 1),
              TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 1),
            ]);
            final angle = Tween(begin: 0 / 360, end: -90 / 360);
            return RotationTransition(
              turns: controller.index == 1
                  ? angle.animate(animation)
                  : angle.animate(ReverseAnimation(animation)),
              alignment: Alignment.center,
              child: ScaleTransition(
                scale: tween.animate(animation),
                child: child,
              ),
            );
          },
          child: controller.index == 1
              ? FloatingActionButton(
                  key: UniqueKey(),
                  onPressed: () {},
                  child: Transform.rotate(
                    child: Icon(Icons.message),
                    angle: math.pi / 2,
                  ),
                )
              : FloatingActionButton(
                  key: UniqueKey(),
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
        ),
      ),
    );
  }
}
