import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

////-------- Bottom App Bar that has been populated from Firestore. Spaces items evenly and will allow scroll when contents are too large to fit. 8th March 2019. -------
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.pinkAccent,
    ),
    home: BottomAppBarFireStoreScreen(),
  ));
}

class BottomAppBarFireStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FirestoreBottomBar(
        stream: Firestore.instance.collection('items').snapshots(),
        mapper: (DocumentSnapshot doc) {
          return BottomNavItem(
            text: doc.data()['title'],
            onTap: () {
              print('${doc.data()['title']} pressed');
            },
          );
        },
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.favorite),
              const SizedBox(width: 4.0),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}

typedef BottomBarItemMapper = Widget Function(DocumentSnapshot doc);

class FirestoreBottomBar extends StatelessWidget {
  const FirestoreBottomBar({
    Key key,
    @required this.stream,
    @required this.mapper,
  }) : super(key: key);

  final Stream<QuerySnapshot> stream;
  final BottomBarItemMapper mapper;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomAppBar(
      color: theme.primaryColor,
      elevation: 4.0,
      child: Theme(
        data: theme.copyWith(
          textTheme: theme.primaryTextTheme,
          iconTheme: theme.primaryIconTheme,
        ),
        child: IconTheme(
          data: theme.primaryIconTheme,
          child: SizedBox(
            height: kToolbarHeight,
            child: StreamBuilder<QuerySnapshot>(
              stream: stream,
              builder: _buildItems,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      final docs = snapshot.data.documents;
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minWidth: constraints.maxWidth,
                maxWidth: double.infinity,
              ),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: docs.map<Widget>(mapper).toList(growable: false),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }
  }
}
