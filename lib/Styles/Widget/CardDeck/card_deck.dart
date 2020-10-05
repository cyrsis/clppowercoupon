//import 'dart:typed_data';
//
//import 'package:flutter/material.dart';
//import 'dart:convert' show base64;
//
//final Map<String, Uint8List> cardImages = {};
//
//void main() async {
//  encodedCardImages.forEach((key, val) => cardImages[key] = base64.decode(val));
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Cards',
//      home: HomeScreen(),
//    );
//  }
//}
//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//  List<PlayingCard> _deck;
//
//  @override
//  void initState() {
//    super.initState();
//    _deck = _generateDeck();
//  }
//
//  PlayingCard _selected;
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      color: Colors.white,
//      child: Column(
//        children: <Widget>[
//          Expanded(
//            flex: 1,
//            child: SizedBox(),
//          ),
//          Expanded(
//            flex: 2,
//            child: ListView.builder(
//              padding: EdgeInsets.all(16.0),
//              scrollDirection: Axis.horizontal,
//              itemCount: _deck.length + 1,
//              itemBuilder: (BuildContext context, int index) {
//                if (index >= _deck.length) {
//                  return Align(
//                    alignment: Alignment.bottomLeft,
//                    widthFactor: 0.7,
//                    child: GestureDetector(
//                      behavior: HitTestBehavior.opaque,
//                      onTap: () => _onTapCard(_deck[index - 1]),
//                      child: SizedBox(
//                        width: 120.0,
//                        child: AspectRatio(
//                          aspectRatio: 0.7,
//                        ),
//                      ),
//                    ),
//                  );
//                }
//                final card = _deck[index];
//                return AnimatedCard(
//                  selected: card == _selected,
//                  widthFactor: 0.3,
//                  child: SizedBox(
//                    width: 120.0,
//                    //widthFactor: 0.3,
//                    child: PlayingCardWidget(
//                      card: card,
//                      onPressed: () => _onTapCard(card),
//                    ),
//                  ),
//                );
//              },
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  void _onTapCard(PlayingCard card) {
//    setState(() {
//      //print('$card');
//      _selected = card;
//    });
//  }
//
//  List<PlayingCard> _generateDeck() {
//    return PlayingSuite.values
//        .map<List<PlayingCard>>((suite) =>
//            List.generate(13, (int card) => PlayingCard(suite, card)))
//        .reduce((value, element) => value..addAll(element))
//        .toList(growable: false);
//  }
//}
//
//class AnimatedCard extends StatefulWidget {
//  const AnimatedCard({
//    Key key,
//    @required this.selected,
//    this.widthFactor,
//    this.heightFactor,
//    @required this.child,
//  }) : super(key: key);
//
//  final bool selected;
//  final double widthFactor;
//  final double heightFactor;
//  final Widget child;
//
//  @override
//  _AnimatedCardState createState() => _AnimatedCardState();
//}
//
//class _AnimatedCardState extends State<AnimatedCard>
//    with SingleTickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<AlignmentGeometry> _animation;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: const Duration(milliseconds: 450),
//      vsync: this,
//    );
//    _animation = AlignmentTween(
//            begin: Alignment.bottomLeft, end: Alignment.topLeft)
//        .animate(
//            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
//    _updateAnimation();
//  }
//
//  @override
//  void didUpdateWidget(AnimatedCard oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (oldWidget.selected != widget.selected) {
//      _updateAnimation();
//    }
//  }
//
//  void _updateAnimation() {
//    if (widget.selected) {
//      _controller.forward();
//    } else {
//      _controller.reverse();
//    }
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AlignTransition(
//      alignment: _animation,
//      widthFactor: widget.widthFactor,
//      heightFactor: widget.heightFactor,
//      child: widget.child,
//    );
//  }
//}
//
//class PlayingCardWidget extends StatelessWidget {
//  const PlayingCardWidget({
//    Key key,
//    @required this.card,
//    this.onPressed,
//  }) : super(key: key);
//
//  final PlayingCard card;
//  final VoidCallback onPressed;
//
//  @override
//  Widget build(BuildContext context) {
//    return AspectRatio(
//      aspectRatio: 0.7,
//      child: GestureDetector(
//        onTap: onPressed,
//        child: Container(
//          decoration: BoxDecoration(
//            color: Colors.white,
//            border: Border.all(color: Colors.black),
//            borderRadius: BorderRadius.circular(3.0),
//          ),
//          child: Image.memory(card.imageData, fit: BoxFit.cover),
//        ),
//      ),
//    );
//  }
//}
//
//enum PlayingSuite {
//  Hearts,
//  Diamonds,
//  Clubs,
//  Spades,
//}
//
//class PlayingCard {
//  final PlayingSuite suite;
//  final int index;
//
//  PlayingCard(this.suite, this.index)
//      : assert(suite != null),
//        assert(index >= 0 && index <= 12);
//
//  Uint8List get imageData => cardImages[toString()];
//
//  @override
//  String toString() => '${index + 1}${suite.toString().substring(13, 14)}';
//}
