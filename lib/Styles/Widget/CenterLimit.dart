import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

////-------- Some examples of centring with stretch and different ways to accomplish it. 7th Match 2019 -------
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.pinkAccent,
      ),
      home: ExampleScreen(),
    ),
  );
}

typedef ExampleBuilder = Widget Function(List<Widget> children);

class ExampleScreen extends StatelessWidget {
  final _builders = <ExampleBuilder>[
    (children) => Solution1(children: children),
    (children) => Solution2(children: children, sizeByIndex: 0),
    (children) => Solution3(children: children),
    (children) => Solution4(children: children),
    (children) => Solution5(children: children),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: PageView(
          children: List.generate(_builders.length, (int index) {
            return DebugPaint(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello World: Solution${index + 1}'),
                  SizedBox(height: 32.0),
                  _builders[index](makeChildren()),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  List<Widget> makeChildren() {
    return <Widget>[
      Text(
        'Enter Your Code',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        'Tap here to go back and try again',
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
          color: Colors.green,
        ),
        textAlign: TextAlign.center,
      ),
      TextField(
        decoration: const InputDecoration(
          hintText: 'Enter Code',
          hintStyle: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        textAlign: TextAlign.center,
      ),
      RaisedButton(
        color: Colors.green,
        onPressed: () {},
        child: Text('Next'),
      ),
    ];
  }
}

class Solution5 extends StatelessWidget {
  const Solution5({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class Solution4 extends StatelessWidget {
  const Solution4({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class Solution3 extends MultiChildRenderObjectWidget {
  Solution3({
    Key key,
    @required List<Widget> children,
  })  : assert(children != null),
        super(
          key: key,
          children: children,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSolution3();
  }
}

class RenderSolution3 extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _Solution3Data>,
        RenderBoxContainerDefaultsMixin<RenderBox, _Solution3Data> {
  RenderSolution3({
    List<RenderBox> children,
  }) {
    addAll(children);
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! _Solution3Data) {
      child.parentData = _Solution3Data();
    }
  }

  @override
  void performLayout() {
    List<RenderBox> children = getChildrenAsList();

    double width = 0.0;
    for (int index = 0; index < children.length; index++) {
      final child = children[index];
      final childWidth = child.computeMaxIntrinsicWidth(constraints.maxHeight);
      if (childWidth > width) {
        width = childWidth;
      }
    }

    final childConstraints = BoxConstraints.tightForFinite(width: width);
    double height = 0.0;
    for (int index = 0; index < children.length; index++) {
      final child = children[index];
      _Solution3Data childData = child.parentData;
      child.layout(childConstraints, parentUsesSize: true);
      childData.offset = Offset(0.0, height);
      height += child.size.height;
    }

    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(HitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

class _Solution3Data extends ContainerBoxParentData<RenderBox> {}

class Solution2 extends MultiChildRenderObjectWidget {
  Solution2({
    Key key,
    @required List<Widget> children,
    @required this.sizeByIndex,
  })  : assert(children != null && sizeByIndex != null),
        super(key: key, children: children);

  final int sizeByIndex;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSolution2(
      sizeByIndex: sizeByIndex,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderSolution2 renderObject) {
    renderObject..sizeByIndex = sizeByIndex;
  }
}

class RenderSolution2 extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _Solution2Data>,
        RenderBoxContainerDefaultsMixin<RenderBox, _Solution2Data> {
  RenderSolution2({
    int sizeByIndex,
    List<RenderBox> children,
  }) : _sizeByIndex = sizeByIndex {
    addAll(children);
  }

  int _sizeByIndex;

  int get sizeByIndex => _sizeByIndex;

  set sizeByIndex(int value) {
    _sizeByIndex = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! _Solution2Data) {
      child.parentData = _Solution2Data();
    }
  }

  @override
  void performLayout() {
    List<RenderBox> children = getChildrenAsList();

    final first = constraints.loosen();
    children[sizeByIndex].layout(first, parentUsesSize: true);
    final firstSize = children[sizeByIndex].size;

    final second = BoxConstraints.tightForFinite(width: firstSize.width);
    double width = 0.0, height = 0.0;
    for (int index = 0; index < children.length; index++) {
      final child = children[index];
      if (index != sizeByIndex) {
        child.layout(second, parentUsesSize: true);
      }
      if (child.size.width > width) {
        width = child.size.width;
      }
      height += child.size.height;
    }

    double top = 0.0;
    for (int index = 0; index < children.length; index++) {
      final child = children[index];
      _Solution2Data childData = child.parentData;
      childData.offset = Offset((width - child.size.width) / 2, top);
      top += child.size.height;
    }

    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(HitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

class _Solution2Data extends ContainerBoxParentData<RenderBox> {}

class Solution1 extends StatelessWidget {
  const Solution1({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomMultiChildLayout(
        delegate: SizeByChildDelegate(
          sizeById: 0,
          count: children.length,
        ),
        children: List.generate(children.length, (int index) {
          return LayoutId(id: index, child: children[index]);
        }),
      ),
    );
  }
}

class SizeByChildDelegate extends MultiChildLayoutDelegate {
  SizeByChildDelegate({
    @required this.sizeById,
    @required this.count,
  });

  final int sizeById;
  final int count;

  @override
  void performLayout(Size size) {
    final first = BoxConstraints.loose(size);
    final firstSize = layoutChild(sizeById, first);
    final second = BoxConstraints.tightForFinite(width: firstSize.width);
    final sizes = <int, Size>{};
    for (int index = 0; index < count; index++) {
      if (index != sizeById) {
        sizes[index] = layoutChild(index, second);
      } else {
        sizes[index] = firstSize;
      }
    }
    double height = sizes.values.fold(0.0, (prev, size) => prev + size.height);
    double top = (size.height - height) / 2;
    for (int index = 0; index < count; index++) {
      final childSize = sizes[index];
      positionChild(index, Offset((size.width - childSize.width) / 2, top));
      top += childSize.height;
    }
  }

  @override
  bool shouldRelayout(SizeByChildDelegate oldDelegate) => true;
}

class DebugPaint extends SingleChildRenderObjectWidget {
  DebugPaint({
    Key key,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  RenderObject createRenderObject(BuildContext context) => RenderDebugPaint();
}

class RenderDebugPaint extends RenderProxyBox {
  RenderDebugPaint([RenderBox child]) : super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    debugPaintSizeEnabled = true;
    try {
      super.paint(context, offset);
    } finally {
      debugPaintSizeEnabled = false;
    }
  }
}
