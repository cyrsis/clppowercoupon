import 'package:clppowercoupon/Styles/AppStyle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_builder.dart';

import 'Bloc/IntlBloc/intl_bloc.dart';
import 'Bloc/IntlBloc/intl_event.dart';
import 'CodeForRedeemScreen.dart';
import 'OperationMenuScreen.dart';
import 'RegisterScreen.dart';
import 'SignInScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _intlBloc = new IntlBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntlBloc>(
            builder: (BuildContext context) =>
                _intlBloc..dispatch(ChangeToCHTEvent())),
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'UR Coupon System Spec 1.2',
        theme: ThemeData(
          primaryColor: Color(0xFF112E87),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(
            title:
                'CLP Coupon System \n Operator App (Design - 1.2 System 1.0)')),
        // home: CodeForRedeemScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    void _pushPage(BuildContext context, Widget page) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SignInButtonBuilder(
                icon: Icons.person_add,
                backgroundColor: Colors.indigo,
                text: 'Registration',
                onPressed: () => _pushPage(context, RegisterScreen()),
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
            Container(
              child: SignInButtonBuilder(
                icon: Icons.verified_user,
                backgroundColor: Colors.orange,
                text: 'Sign In',
                onPressed: () => _pushPage(context, SignInScreen()),
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
