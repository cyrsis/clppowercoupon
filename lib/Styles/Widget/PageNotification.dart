import 'package:flutter/material.dart';

void main() => runApp(ExampleApp());

////-------- Page Notification Example -------
class ExampleApp extends StatefulWidget {
  @override
  ExampleAppState createState() => ExampleAppState();
}

class ExampleAppState extends State<ExampleApp> {
  final _pageController = PageController(viewportFraction: 0.5);
  final _pageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) => _pageNotifier.value = page,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return PageItem(
              pageIndex: index,
              pageNotifier: _pageNotifier,
            );
          },
        ),
      ),
    );
  }
}

class PageItem extends StatefulWidget {
  const PageItem({
    Key key,
    @required this.pageIndex,
    @required this.pageNotifier,
  }) : super(key: key);

  final int pageIndex;
  final ValueNotifier<int> pageNotifier;

  @override
  _PageItemState createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  bool _current = false;

  @override
  void initState() {
    super.initState();
    widget.pageNotifier.addListener(_onPageChanged);
    _onPageChanged();
  }

  void _onPageChanged() {
    setState(() => _current = (widget.pageNotifier.value == widget.pageIndex));
  }

  @override
  void dispose() {
    widget.pageNotifier.removeListener(_onPageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _current ? Colors.greenAccent : Colors.redAccent,
      padding: const EdgeInsets.all(24.0),
      child: FittedBox(
        alignment: Alignment.center,
        child: Text(
          _current
              ? 'Active ${widget.pageIndex}'
              : 'Inactive ${widget.pageIndex}',
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
