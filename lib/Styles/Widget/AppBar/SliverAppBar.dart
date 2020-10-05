import 'package:flutter/material.dart';
import '../../AppStyleExport.dart';

class SliverCustomScrollViewScreen extends StatefulWidget {
  @override
  _SliverCustomScrollViewScreenState createState() =>
      _SliverCustomScrollViewScreenState();
}

class _SliverCustomScrollViewScreenState
    extends State<SliverCustomScrollViewScreen> {
  String img1 =
      "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img2 =
      "https://images.pexels.com/photos/262438/pexels-photo-262438.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img3 =
      "https://images.pexels.com/photos/865002/pexels-photo-865002.jpeg?auto=compress&cs=tinysrgb&h=350";
  String img4 =
      "https://images.pexels.com/photos/39397/dart-target-aim-arrow-39397.jpeg?auto=compress&cs=tinysrgb&h=350";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        reverse: true,
        slivers: <Widget>[
          MyAppBar(
            imgUrl: AppImage.ImagesNetwork[0],
          ),
          MyAppBar(
            imgUrl: img2,
          ),
          MyAppBar(
            imgUrl: img3,
          ),
          MyAppBar(
            imgUrl: img4,
          ),
          SliverFillRemaining(
            child: Container(),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final String imgUrl;

  const MyAppBar({
    Key key,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
        title: const Text('You must see this'),
        centerTitle: true,
      ),
    );
  }
}
