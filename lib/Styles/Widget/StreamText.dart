import 'dart:async';

import 'package:flutter/material.dart';
import '../AppStyleExport.dart';

void main() => runApp(MaterialApp(
      home: StreamTextScreen(),
    ));

class StreamTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<int>(
      stream: AppStream.StreamText2(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(snapshot.data.toString()),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
