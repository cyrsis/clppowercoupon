import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(ChartsDemoApp());

////-------- Charts Demo - 10th October 2018 - #HumpdayQandA -------
class ChartsDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.pink,
      ),
      title: 'Charts Demo',
      color: Colors.indigo,
      home: DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  @override
  DemoScreenState createState() => DemoScreenState();
}

class DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Container(
          height: 100.0,
          child: CustomChart(
            data: <ChartData>[
              ChartData('Sub Compact', 25, Colors.red),
              ChartData('Large', 100, Colors.red),
              ChartData('Mid Luxury', 75, Colors.yellow),
              ChartData('Premium Luxury', 25, Colors.red),
              ChartData('Midsize Sporty', 75, Colors.red),
              ChartData('Entry CUV', 75, Colors.yellow),
              ChartData('Heavy Duty Truck', 75, Colors.red),
              ChartData('Cargo Van', 25, Colors.red),
            ],
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 9.0,
            ),
            lineColor: Colors.white,
            spacing: 5.0,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
          ),
        ),
      ),
    );
  }
}

class CustomChart extends StatefulWidget {
  const CustomChart({
    Key key,
    @required this.data,
    this.textStyle,
    this.lineColor = Colors.black,
    this.spacing = 5.0,
    this.padding = EdgeInsets.zero,
    this.duration = const Duration(milliseconds: 650),
    this.curve = Curves.easeIn,
  })  : assert(lineColor != null),
        assert(spacing != null),
        assert(padding != null),
        super(key: key);

  final List<ChartData> data;
  final TextStyle textStyle;
  final Color lineColor;
  final double spacing;
  final EdgeInsets padding;
  final Duration duration;
  final Curve curve;

  @override
  CustomChartState createState() => CustomChartState();
}

class CustomChartState extends State<CustomChart>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _maxDatumAnim;
  List<Animation<double>> _valueAnimations;
  List<Animation<Color>> _colorAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    updateAnimations();
  }

  @override
  void didUpdateWidget(CustomChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateAnimations(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateAnimations([CustomChart old]) {
    // Determine maximum data value
    double maxDatum = double.negativeInfinity;
    for (int i = 0; i < widget.data.length; i++) {
      maxDatum = max(maxDatum, widget.data[i].value.toDouble());
    }
    double previousMax = _maxDatumAnim != null ? _maxDatumAnim.value : maxDatum;
    _maxDatumAnim = Tween<double>(begin: previousMax, end: maxDatum)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _valueAnimations = <Animation<double>>[];
    _colorAnimations = <Animation<Color>>[];
    for (int i = 0; i < widget.data.length; i++) {
      final begin = (old != null && i < old.data.length)
          ? old.data[i].value.toDouble()
          : 0.0;
      final end = widget.data[i].value.toDouble();
      _valueAnimations.add(Tween<double>(begin: begin, end: end)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve)));
      final beginColor = (old != null && i < old.data.length)
          ? old.data[i].color
          : widget.lineColor;
      final endColor = widget.data[i].color;
      _colorAnimations.add(ColorTween(begin: beginColor, end: endColor)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve)));
    }
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final mergedStyle =
        DefaultTextStyle.of(context).style.merge(widget.textStyle);
    return Padding(
      padding: widget.padding,
      child: CustomPaint(
        painter: _ChartPainter(
          textStyle: mergedStyle,
          data: widget.data,
          lineColor: widget.lineColor,
          spacing: widget.spacing,
          repaint: _controller,
          valueAnimations: _valueAnimations,
          colorAnimations: _colorAnimations,
          maxDatumAnim: _maxDatumAnim,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final TextStyle textStyle;
  final List<ChartData> data;
  final Color lineColor;
  final double spacing;
  final Animation<double> repaint;
  final List<Animation<double>> valueAnimations;
  final List<Animation<Color>> colorAnimations;
  final Animation<double> maxDatumAnim;

  TextPainter _textPainter;

  _ChartPainter({
    @required this.textStyle,
    @required this.data,
    @required this.lineColor,
    @required this.spacing,
    @required this.repaint,
    @required this.valueAnimations,
    @required this.colorAnimations,
    @required this.maxDatumAnim,
  }) : super(repaint: repaint) {
    _textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate 2em units of height in chosen TextStyle for Axis Height
    _textPainter.text = TextSpan(style: textStyle, text: "M\nM");
    _textPainter.layout(maxWidth: size.width);
    final axisHeight = _textPainter.height;

    // Determine height's of other parts
    final tickHeight = (spacing * 2);
    final chartHeight = size.height - axisHeight - tickHeight;
    final chartWidth = size.width;

    // Draw each bar in the chart
    double tickWidth = chartWidth / data.length;
    Paint barPaint = Paint()..style = PaintingStyle.fill;
    double x = 0.0;
    for (int i = 0; i < data.length; i++, x += tickWidth) {
      double barHeight =
          chartHeight * (valueAnimations[i].value / maxDatumAnim.value);
      barPaint.color = colorAnimations[i].value;
      canvas.drawRect(
          Rect.fromLTRB(x + spacing, chartHeight - barHeight,
              x + tickWidth - spacing, chartHeight),
          barPaint);
    }

    // Draw axis line
    Paint linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = lineColor;
    canvas.drawLine(
        Offset(0.0, chartHeight), Offset(chartWidth, chartHeight), linePaint);

    // Draw each tick marker and label for bar.
    x = 0.0;
    for (int i = 0; i < data.length; i++, x += tickWidth) {
      // Draw tick mark
      final tickStart = Offset(x + tickWidth * 0.5, chartHeight);
      final tickEnd = Offset(x + tickWidth * 0.5, chartHeight + tickHeight);
      canvas.drawLine(tickStart, tickEnd, linePaint);

      // Layout text
      _textPainter.text = TextSpan(style: textStyle, text: data[i].label);
      _textPainter.layout(maxWidth: chartWidth);

      // Draw text limited to left and right edges
      var pos = tickEnd - Offset(_textPainter.width / 2.0, 0.0);
      if (pos.dx < 0.0) {
        pos = Offset(0.0, pos.dy);
      }
      if (pos.dx > chartWidth) {
        pos = Offset(chartWidth - _textPainter.width, 0.0);
      }
      if (i.isOdd) {
        pos = Offset(pos.dx, pos.dy + _textPainter.height);
      }
      _textPainter.paint(canvas, pos);
    }
  }

  @override
  bool shouldRepaint(_ChartPainter old) =>
      old.textStyle != textStyle ||
      old.data != data ||
      old.lineColor != lineColor ||
      old.spacing != spacing;
}

class ChartData {
  final String label;
  final int value;
  final Color color;

  const ChartData(this.label, this.value, this.color);
}
