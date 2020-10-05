import 'package:flutter/material.dart';
//ScrollView With Height for Flutter.
// Simple ScrollView with its content having a minimum height of the ScrollView's parent.
// This allows you to space out your components inside your ScrollView to fit the avaliable space and not have them "squish up" when the soft keyboard (IME) appears.

class ScrollViewWithHeight extends StatelessWidget {
  final Widget child;

  const ScrollViewWithHeight({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return new SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: constraints.copyWith(
              minHeight: constraints.maxHeight, maxHeight: double.infinity),
          child: child,
        ),
      );
    });
  }
}
