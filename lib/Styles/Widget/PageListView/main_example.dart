import 'dart:async';
import 'package:flutter/material.dart';
import './paged_listview.dart';

////-------- Paged ListView -
// Loads data async into the list. You'll notice if you scroll slowly you'll never see the loading spinner,
// this is because we specify a `cacheExtent` to the widget.
// `separatorBuilder` is completely optional.
// You can override the default loading spinner by specifying a `loadingBuilder`.
// Return null from the `itemLoader` to stop loa… -------

void main() => runApp(MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeScreen> {
  final GlobalKey<PagedListViewState> _pagedList = GlobalKey();

  int _page = 0;
  int _max = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load paging data'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _max += 3;
              _pagedList.currentState.tryLoadingMoreData();
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          assert(constraints.hasBoundedHeight);
          return PagedListView<TestModel>(
            key: _pagedList,
            itemLoader: loadMore,
            itemBuilder: (BuildContext context, int index, TestModel data) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                title: Text(data.page),
                subtitle: Text(data.item),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 2.0),
            // We wrap our PagedListView in a LayoutBuilder to get the height of the parent
            // so we can supply a cacheExtent to the ListView so we load items before they
            // are displayed on the screen.
            cacheExtent: constraints.constrainHeight() * 2,
          );
        },
      ),
    );
  }

  Future<List<TestModel>> loadMore(List<TestModel> current) async {
    print('Loading more: ${current.length}');
    if (_page < _max) {
      await Future.delayed(Duration(seconds: 2));
      _page++;
      return List.generate(
          10,
          (int index) => TestModel(
                'Page $_page',
                'Item $index',
              ));
    }
    return null;
  }
}

class TestModel {
  final String page;
  final String item;

  const TestModel(this.page, this.item);
}
