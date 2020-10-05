import 'package:flutter/material.dart';

//Shadow is something start at the middle then
//Just x and y values
class AppBoxShadow {
  static get Off40402020 => [
        BoxShadow(offset: Offset(40, 40), color: Colors.pink),
        BoxShadow(offset: Offset(20, 20), color: Colors.yellow),
      ];

   static get RedoffSet => new BoxShadow(
        color: Colors.red,
        offset: new Offset(20.0,
            10.0), //moved the shadow 20 on the X axis and 10 on the Y axis
      );

  static get BlurRadius => new BoxShadow(
      color: Colors.red,
      offset: new Offset(20.0, 10.0),
      blurRadius: 20.0,
      spreadRadius: 40.0);
}
