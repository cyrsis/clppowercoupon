import 'package:flutter/material.dart';

////-------- Flutter TargetBorder for BoxDecoration -------
class TargetBorder extends Border {
  const TargetBorder({
    BorderSide side = const BorderSide(color: Colors.white, width: 2.0),
    this.depth = 25.0,
    this.strokeCap = StrokeCap.square,
  }) : super(top: side, right: side, bottom: side, left: side);

  final double depth;
  final StrokeCap strokeCap;

  @override
  void paint(Canvas canvas, Rect rect,
      {TextDirection textDirection,
      BoxShape shape = BoxShape.rectangle,
      BorderRadius borderRadius}) {
    assert(isUniform);
    final double width = top.width;
    final Paint paint = top.toPaint()..strokeCap = strokeCap;
    final Rect outline = rect.deflate(width / 2.0);
    final Offset horizontal = Offset(depth, 0.0);
    final Offset vertical = Offset(0.0, depth);
    canvas.drawLine(outline.topLeft, outline.topLeft + horizontal, paint);
    canvas.drawLine(outline.topLeft, outline.topLeft + vertical, paint);
    canvas.drawLine(outline.topRight, outline.topRight - horizontal, paint);
    canvas.drawLine(outline.topRight, outline.topRight + vertical, paint);
    canvas.drawLine(
        outline.bottomRight, outline.bottomRight - horizontal, paint);
    canvas.drawLine(outline.bottomRight, outline.bottomRight - vertical, paint);
    canvas.drawLine(outline.bottomLeft, outline.bottomLeft + horizontal, paint);
    canvas.drawLine(outline.bottomLeft, outline.bottomLeft - vertical, paint);
  }
}
