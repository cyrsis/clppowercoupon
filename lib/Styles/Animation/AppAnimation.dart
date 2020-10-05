import 'package:simple_animations/simple_animations.dart';
import 'package:flutter/material.dart';

class AppAnimation {
  static final tween = MultiTrackTween([
    Track("color1").add(Duration(seconds: 3),
        ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900)),
    Track("color2").add(Duration(seconds: 3),
        ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600))
  ]);

  static TweenFastOutSlowIn(controller) =>
      Tween(begin: 0.0, end: -0.025).animate(
          CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));
}
