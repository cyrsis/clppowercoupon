import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(TestApp());

enum TestId {
  First,
  Second,
  Third,
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: CustomSizedMultiChildLayout(
          delegate: TestDelegate(),
          children: <Widget>[
            LayoutId(
              id: TestId.Second,
              child:
                  Container(color: Colors.green, width: 100.0, height: 100.0),
            ),
            LayoutId(
              id: TestId.First,
              child: Container(color: Colors.red, width: 50.0, height: 50.0),
            ),
            LayoutId(
              id: TestId.Third,
              child: Container(color: Colors.blue, width: 50.0, height: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}

class TestDelegate extends SizedMultiChildLayoutDelegate {
  @override
  Size performLayout(Size size) {
    final max = BoxConstraints.loose(size);
    layoutChild(TestId.First, max);
    var result = layoutChild(TestId.Second, max);
    layoutChild(TestId.Third, max);
    positionChild(TestId.First, Offset(50.0, 0.0));
    positionChild(TestId.Second, Offset(0.0, 0.0));
    positionChild(TestId.Third, Offset(0.0, 50.0));
    return result;
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}

//
// Same as CustomMultiChildLayout except uses SizedMultiChildLayoutDelegate with RenderCustomSizedMultiChildLayoutBox
//
class CustomSizedMultiChildLayout extends CustomMultiChildLayout {
  CustomSizedMultiChildLayout({
    Key key,
    @required SizedMultiChildLayoutDelegate delegate,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children, delegate: delegate);

  @override
  RenderCustomSizedMultiChildLayoutBox createRenderObject(
          BuildContext context) =>
      RenderCustomSizedMultiChildLayoutBox(
          delegate: delegate as SizedMultiChildLayoutDelegate);
}

// Extends original but changes uses the new delegate to return the size
class RenderCustomSizedMultiChildLayoutBox
    extends RenderCustomMultiChildLayoutBox {
  RenderCustomSizedMultiChildLayoutBox(
      {List<RenderBox> children,
      @required SizedMultiChildLayoutDelegate delegate})
      : super(children: children, delegate: delegate);

  SizedMultiChildLayoutDelegate get delegate => super.delegate;

  @override
  void performLayout() {
    size = delegate._callPerformLayout(constraints.biggest, firstChild);
  }

  @override
  double computeMinIntrinsicWidth(double height) => 0.0;

  @override
  double computeMaxIntrinsicWidth(double height) => constraints.maxWidth;

  @override
  double computeMinIntrinsicHeight(double width) => 0.0;

  @override
  double computeMaxIntrinsicHeight(double width) => constraints.maxHeight;
}

// The rest is more or less the same as MultiChildLayoutDelegate except
// we return a size from _callPerformLayout.
//
abstract class SizedMultiChildLayoutDelegate
    implements MultiChildLayoutDelegate {
  Map<Object, RenderBox> _idToChild;
  Set<RenderBox> _debugChildrenNeedingLayout;

  /// True if a non-null LayoutChild was provided for the specified id.
  ///
  /// Call this from the [performLayout] or [getSize] methods to
  /// determine which children are available, if the child list might
  /// vary.
  bool hasChild(Object childId) => _idToChild[childId] != null;

  /// Ask the child to update its layout within the limits specified by
  /// the constraints parameter. The child's size is returned.
  ///
  /// Call this from your [performLayout] function to lay out each
  /// child. Every child must be laid out using this function exactly
  /// once each time the [performLayout] function is called.
  Size layoutChild(Object childId, BoxConstraints constraints) {
    final RenderBox child = _idToChild[childId];
    assert(() {
      if (child == null) {
        throw new FlutterError(
            'The $this custom multichild layout delegate tried to lay out a non-existent child.\n'
            'There is no child with the id "$childId".');
      }
      if (!_debugChildrenNeedingLayout.remove(child)) {
        throw new FlutterError(
            'The $this custom multichild layout delegate tried to lay out the child with id "$childId" more than once.\n'
            'Each child must be laid out exactly once.');
      }
      try {
        assert(constraints.debugAssertIsValid(isAppliedConstraint: true));
      } on AssertionError catch (exception) {
        throw new FlutterError(
            'The $this custom multichild layout delegate provided invalid box constraints for the child with id "$childId".\n'
            '$exception\n'
            'The minimum width and height must be greater than or equal to zero.\n'
            'The maximum width must be greater than or equal to the minimum width.\n'
            'The maximum height must be greater than or equal to the minimum height.');
      }
      return true;
    }());
    child.layout(constraints, parentUsesSize: true);
    return child.size;
  }

  /// Specify the child's origin relative to this origin.
  ///
  /// Call this from your [performLayout] function to position each
  /// child. If you do not call this for a child, its position will
  /// remain unchanged. Children initially have their position set to
  /// (0,0), i.e. the top left of the [RenderCustomMultiChildLayoutBox].
  void positionChild(Object childId, Offset offset) {
    final RenderBox child = _idToChild[childId];
    assert(() {
      if (child == null) {
        throw new FlutterError(
            'The $this custom multichild layout delegate tried to position out a non-existent child:\n'
            'There is no child with the id "$childId".');
      }
      if (offset == null) {
        throw new FlutterError(
            'The $this custom multichild layout delegate provided a null position for the child with id "$childId".');
      }
      return true;
    }());
    final MultiChildLayoutParentData childParentData = child.parentData;
    childParentData.offset = offset;
  }

  String _debugDescribeChild(RenderBox child) {
    final MultiChildLayoutParentData childParentData = child.parentData;
    return '${childParentData.id}: $child';
  }

  Size _callPerformLayout(Size size, RenderBox firstChild) {
    // A particular layout delegate could be called reentrantly, e.g. if it used
    // by both a parent and a child. So, we must restore the _idToChild map when
    // we return.
    final Map<Object, RenderBox> previousIdToChild = _idToChild;

    Size result;

    Set<RenderBox> debugPreviousChildrenNeedingLayout;
    assert(() {
      debugPreviousChildrenNeedingLayout = _debugChildrenNeedingLayout;
      _debugChildrenNeedingLayout = new Set<RenderBox>();
      return true;
    }());

    try {
      _idToChild = <Object, RenderBox>{};
      RenderBox child = firstChild;
      while (child != null) {
        final MultiChildLayoutParentData childParentData = child.parentData;
        assert(() {
          if (childParentData.id == null) {
            throw new FlutterError('The following child has no ID:\n'
                '  $child\n'
                'Every child of a RenderCustomMultiChildLayoutBox must have an ID in its parent data.');
          }
          return true;
        }());
        _idToChild[childParentData.id] = child;
        assert(() {
          _debugChildrenNeedingLayout.add(child);
          return true;
        }());
        child = childParentData.nextSibling;
      }
      result = performLayout(size);
      assert(() {
        if (_debugChildrenNeedingLayout.isNotEmpty) {
          if (_debugChildrenNeedingLayout.length > 1) {
            throw new FlutterError(
                'The $this custom multichild layout delegate forgot to lay out the following children:\n'
                '  ${_debugChildrenNeedingLayout.map(_debugDescribeChild).join("\n  ")}\n'
                'Each child must be laid out exactly once.');
          } else {
            throw new FlutterError(
                'The $this custom multichild layout delegate forgot to lay out the following child:\n'
                '  ${_debugDescribeChild(_debugChildrenNeedingLayout.single)}\n'
                'Each child must be laid out exactly once.');
          }
        }
        return true;
      }());
    } finally {
      _idToChild = previousIdToChild;
      assert(() {
        _debugChildrenNeedingLayout = debugPreviousChildrenNeedingLayout;
        return true;
      }());
    }
    return result;
  }

  /// Override this method to return the size of this object given the
  /// incoming constraints.
  ///
  /// The size cannot reflect the sizes of the children. If this layout has a
  /// fixed width or height the returned size can reflect that; the size will be
  /// constrained to the given constraints.
  ///
  /// By default, attempts to size the box to the biggest size
  /// possible given the constraints.
  Size getSize(BoxConstraints constraints) => constraints.biggest;

  /// Override this method to lay out and position all children given this
  /// widget's size.
  ///
  /// This method must call [layoutChild] for each child. It should also specify
  /// the final position of each child with [positionChild].
  Size performLayout(Size size);

  /// Override this method to return true when the children need to be
  /// laid out.
  ///
  /// This should compare the fields of the current delegate and the given
  /// `oldDelegate` and return true if the fields are such that the layout would
  /// be different.
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate);

  /// Override this method to include additional information in the
  /// debugging data printed by [debugDumpRenderTree] and friends.
  ///
  /// By default, returns the [runtimeType] of the class.
  @override
  String toString() => '$runtimeType';
}
