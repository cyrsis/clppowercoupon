//"Android Fill Viewport" style of content for Flutter, where even when the keyboard appears the content flows behind.

//class SomeWidgetState extends State<SomeWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(body: new LayoutBuilder(builder: _buildContent));
//  }
//
//  Widget _buildContent(BuildContext context, BoxConstraints constraints) {
//    if (constraints.hasBoundedHeight) {
//      constraints = constraints.copyWith(
//          maxHeight: constraints.maxHeight +
//              MediaQuery.of(context).viewInsets.vertical);
//    }
//    return new SingleChildScrollView(
//      child: new ConstrainedBox(
//        constraints: constraints,
//        child: new Column(
//          children: <Widget>[
//            /* ... */
//          ],
//        ),
//      ),
//    );
//  }
//}
