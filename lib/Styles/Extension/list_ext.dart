import 'package:flutter/material.dart';

extension ListExt<T> on List<T> {
  List<T> copy() => List.from(this, growable: true);

  List<Y> mapIndexed<Y>(Y Function(T, int) onMap) =>
      asMap().entries.map((entry) =>
          onMap(entry.value, entry.key)).toList();
}


//List<Widget> _avatars() => urls.mapIndexed((url, index) {
//  final padding = _spaceBetween * index;
//  return Positioned(
//    top: 0.0,
//    left: 0.0 + padding,
//    child: Avatar(
//      size: size,
//      imageUrl: url,
//    ),
//  );
//});

