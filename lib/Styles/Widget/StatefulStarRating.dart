import 'package:flutter/material.dart';
import '../../Styles/Widget/StarDisplayWidget.dart';

class StatefulStarRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rating = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return Material(
          child: StarRating(
            onChanged: (index) {
              setState(() {
                rating = index;
              });
            },
            value: rating,
          ),
        );
      },
    );
  }
}
