import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';

class SpecsScreen extends StatefulWidget {
  SpecsScreen({Key key}) : super(key: key);

  @override
  _SpecsScreenState createState() => new _SpecsScreenState();
}

class _SpecsScreenState extends State<SpecsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "isLandscape: ${context.isLandscape}, \n"
        "sizePx: ${context.sizePx},\n"
        "widthPx: ${context.widthPx},\n"
        "heightPx: ${context.heightPx},\n"
        "diagonalPx: ${context.diagonalPx},\n"
        "sizeInches: ${context.sizeInches},\n"
        "widthInches: ${context.widthInches},\n"
        "heightInches: ${context.heightInches},\n"
        "diagonalInches: ${context.diagonalInches},\n"
        "widthPct ${context.widthPct(.1)},\n"
        "heightPct ${context.heightPct(.1)},\n"
        "sizeInches ${context.sizeInches},\n"
        "mq.padding ${context.mq.padding},\n",
      )),
    );
  }
}
