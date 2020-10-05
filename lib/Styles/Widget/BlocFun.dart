//
//import 'dart:async';
//import 'dart:math';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(ExampleApp());
//
//class ExampleApp extends StatefulWidget {
//  @override
//  ExampleAppState createState() => ExampleAppState();
//}
//
//class ExampleAppState extends State<ExampleApp> {
//  List<DataBloc> _blocs;
//
//  @override
//  void initState() {
//    super.initState();
//    _blocs = List.generate(4, (int index) => DataBloc(index, 42));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData.dark(),
//      home: PageView.builder(
//        itemCount: _blocs.length,
//        itemBuilder: (BuildContext context, int index) {
//          return BlocProvider<DataBloc>(
//            creator: () => _blocs[index],
//            child: ExampleScreen(),
//          );
//        },
//      ),
//    );
//  }
//}
//
//class ExampleScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final bloc = BlocProvider.of<DataBloc>(context);
//    return Material(
//      child: Column(
//        children: <Widget>[
//          Expanded(
//            child: Center(
//              child: StreamBuilder<int>(
//                stream: bloc.values,
//                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                  final value =
//                  snapshot.hasData ? snapshot.data.toString() : '';
//                  return AnimatedSwitcher(
//                    duration: const Duration(milliseconds: 250),
//                    child: Text(
//                      value,
//                      key: Key(value),
//                      textScaleFactor: 12.0,
//                    ),
//                  );
//                },
//              ),
//            ),
//          ),
//          Container(
//            alignment: Alignment.center,
//            padding: const EdgeInsets.all(24.0),
//            child: RaisedButton(
//              color: Colors.pink,
//              textColor: Colors.white,
//              onPressed: bloc.nextValueAction,
//              child: Text('Next'),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class DataBloc extends Bloc {
//  final Random _random = Random();
//  final int _index;
//  final BehaviorSubject<int> _subject;
//
//  DataBloc(this._index, int initialValue)
//      : _subject = BehaviorSubject(initialValue);
//
//  @override
//  void init() => print('   init $_index: ${_subject.value}');
//
//  @override
//  void dispose() => print('dispose $_index: ${_subject.value}');
//
//  Stream<int> get values => _subject.stream;
//
//  void nextValueAction() {
//    _subject.value = _random.nextInt(99);
//    print('  value $_index: ${_subject.value}');
//  }
//}
//
//class BehaviorSubject<T> extends ValueListenable<T> {
//  ValueNotifier<T> _latest;
//  StreamController<T> _controller;
//
//  BehaviorSubject(T value) {
//    _latest = ValueNotifier<T>(value);
//    _controller = StreamController<T>.broadcast(
//      onListen: () => _controller.add(_latest.value),
//    );
//  }
//
//  Stream<T> get stream => _controller.stream;
//
//  @override
//  T get value => _latest.value;
//
//  set value(T newValue) {
//    if (_latest.value == newValue) return;
//    _latest.value = newValue;
//    _controller.add(newValue);
//  }
//
//  @override
//  void addListener(listener) => _latest.addListener(listener);
//
//  @override
//  void removeListener(listener) => _latest.removeListener(listener);
//}
//
//abstract class Bloc {
//  void init();
//
//  void dispose();
//}
//
//// --- Warning: HERE BE TYPE DRAGONS!
//
//typedef BlocCreator<T extends Bloc> = T Function();
//
//class BlocProvider<T extends Bloc> extends StatefulWidget {
//  const BlocProvider({
//    Key key,
//    @required this.creator,
//    @required this.child,
//  }) : super(key: key);
//
//  final BlocCreator creator;
//  final Widget child;
//
//  @override
//  _BlocProviderState createState() => _BlocProviderState<T>();
//
//  static T of<T extends Bloc>(BuildContext context) {
//    final type = _typeOf<_BlocProviderScope<T>>();
//    final element = context.ancestorInheritedElementForWidgetOfExactType(type);
//    return (element?.widget as _BlocProviderScope<T>)?.bloc;
//  }
//
//  static Type _typeOf<T>() => T;
//}
//
//class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
//  T _bloc;
//
//  @override
//  void initState() {
//    super.initState();
//    _bloc = widget.creator();
//    _bloc.init();
//  }
//
//  @override
//  void dispose() {
//    _bloc.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return _BlocProviderScope(
//      bloc: _bloc,
//      child: widget.child,
//    );
//  }
//}
//
//class _BlocProviderScope<T extends Bloc> extends InheritedWidget {
//  const _BlocProviderScope({
//    Key key,
//    @required this.bloc,
//    @required Widget child,
//  }) : super(key: key, child: child);
//
//  final T bloc;
//
//  @override
//  bool updateShouldNotify(_BlocProviderScope oldWidget) =>
//      bloc != oldWidget.bloc;
//}
