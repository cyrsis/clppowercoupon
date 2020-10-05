import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './AppStyleExport.dart';
import './AppColors.dart';

//FadeUpwardsPageTransitionsBuilder — fades page as it slides upwards
//OpenUpwardsPageTransitionsBuilder — slides page in upwards, similar to one in Android P.
//ZoomPageTransitionsBuilder — zooms into the new page, similar to one in Android 10
//CupertinoPageTransitionsBuilder, horizontal page transition, same as native iOS page transitions.

class AppTheme {
  final AnniversaryTheme = new ThemeData(
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    fontFamily: 'Bitter',
  );

  final ThemeData AndroidTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    accentColor: Colors.deepPurple,
    buttonColor: Colors.deepPurple,
  );

  final ThemeData IOSTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    accentColor: Colors.blue,
    buttonColor: Colors.blue,
  );
  static final WhiteTheme = ThemeData(primaryColor: Colors.white);
  static const backgroundColor = const Color(0xFF2E2F36);
  static const inputColor = const Color(0xFF27292F);

  static const greenColor = const Color(0xFF1EB980);
  static const greenColor1 = const Color(0xFF29524F);
  static const greenColor2 = const Color(0xFF56AD79);
  static const greenColor3 = const Color(0xFF7AE7B6);
  static const greenColor4 = const Color(0xFF37704C);

  static const yellowColor1 = const Color(0xFFFDDD78);
  static const yellowColor2 = const Color(0xFFF96A51);
  static const yellowColor3 = const Color(0xFFFFD7CF);
  static const yellowColor4 = const Color(0xFFFFA808);

  static const panelColor = const Color(0xFF363840);

  static final theme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: backgroundColor,
    accentColor: greenColor,
    //fontFamily: 'Roboto Condensed'
  );

  static final loginTheme = theme.copyWith(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: inputColor,
      filled: true,
      border: InputBorder.none,
    ),
  );

  static get Teal => ThemeData(primarySwatch: Colors.teal);

  static get Blue => ThemeData(
        primarySwatch: Colors.blue,
      );

  static Orange(context) => ThemeData(
        primaryColor: Colors.deepOrange,
        buttonColor: Colors.white,
        primaryTextTheme: TextTheme(
          caption: Theme.of(context).primaryTextTheme.caption.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      );

  static get TransitionTheme => ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }));

  static get ArroAllen => ThemeData(
        primaryColor: Color(0xffFFDDA5),
        cursorColor: Color(0xffFFDDA5),
        primarySwatch: Colors.orange,
        fontFamily: 'Futura',
      );

  static get SFDisplayPro => ThemeData(fontFamily: 'SF Pro Display');

  static get BlueGreyOrange => ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.deepOrange[200],
      );
  static final ThemeData GM = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.BrightOrgangeGM,
      accentColor: Colors.white,
      dialogBackgroundColor: Colors.transparent);
  static final ThemeData WhiteWhiteTranspent = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      accentColor: Colors.white,
      dialogBackgroundColor: Colors.transparent);

  static final ThemeData FlightTheme =
      new ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
  static final String Title = "MyApps";

  static final ThemeData Apptheme =
      new ThemeData(primaryColor: Colors.blue, accentColor: Colors.cyan[600]);

  static final ThemeData pinktheme = new ThemeData(
      primaryColor: Colors.pinkAccent,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.cyan[600]);

  static final ThemeData iosTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColor: Colors.grey[400],
  );
  static final ThemeData canvasTheme =
      new ThemeData(canvasColor: Colors.greenAccent);

  static final ThemeData defaultAndroidTheme = new ThemeData.light();

  static final ThemeData androidTheme = new ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.cyan[600]);

  static final ThemeData hiddendrawerTheme = new ThemeData(
    primarySwatch: Colors.brown,
  );

  static get WeatherTheme => new ThemeData(
        primarySwatch:
            Colors.blue, //Swatch is useful,because it auto set other others
      );

  static get EggTheme => new ThemeData(
        fontFamily: 'BebasNeue',
      );

  static get FlipCarouselTheme => new ThemeData(
        primarySwatch: Colors.blue,
      );

  static get FeatureDiscoveryTheme => new ThemeData(
        primarySwatch: Colors.blue,
      );

  static get TinderTheme => new ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      );

  static get CartBloc => ThemeData(primaryColor: Colors.white);

  static get SomeTheme => new ThemeData(
      primaryColor: const Color(0xFF151515),
      accentColor: const Color(0xFFFFBC02D),
      backgroundColor: const Color(0xFF212121),
      cardColor: const Color(0xFF2C2C2C),
      highlightColor: const Color(0xFF424242),
      dividerColor: const Color(0xFF616161));

  static get WhiteThemeNoText => new ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
      // counter didn't reset back to zero; the application is not restarted.

      primaryColor: Colors.white,
      primaryColorDark: Colors.white30,
      accentColor: Colors.blue);

  static get RaleWay => new ThemeData(
      primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway');

  static get RaleWayGrey => ThemeData(
        fontFamily: 'Raleway',
        // This colors the [InputOutlineBorder] when it is selected
        primaryColor: Colors.grey[500],
        textSelectionHandleColor: Colors.green[500],
      );

  static get RedF64 => ThemeData(
      primaryColor: Colors.red,
      textTheme: TextTheme(headline: TextStyle(fontSize: 64.0)));

  static get BlueBlue => ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        splashColor: Colors.blueAccent.withOpacity(0.3),
        highlightColor: Colors.blueAccent.withOpacity(0.3),
      );

  static get BlueAccentAmberBlackText => ThemeData(
        primaryColor: Colors.blueAccent[400],
        accentColor: Colors.amber[500],
        canvasColor: const Color(0xFFF8F8F8),
        textTheme: Typography.material2018(platform: defaultTargetPlatform)
            .black
            .apply(
              bodyColor: Colors.blueGrey[900],
              displayColor: Colors.blueGrey[900],
            ),
      );

  static get SwatchGreen =>new ThemeData(
    primarySwatch: Colors.green,
  );
  static get SwatchBlue => new ThemeData(
      primarySwatch: Colors.blue,
      buttonColor: Colors.pink,
      primaryIconTheme: new IconThemeData(color: Colors.black));

  static get AustinFeed => ThemeData.light()
    ..copyWith(
      primaryColor: AppUtils.hexToColor("#3F51B5"),
    );

  static get MussaTheme => ThemeData.dark()
    ..copyWith(
      // sets the background color of the `BottomNavigationBar`
      canvasColor: Color(0xff231f20),
    );

  static get Indigo => new ThemeData(primarySwatch: Colors.indigo);

  static get Yoouma => new ThemeData(
      scaffoldBackgroundColor: Color(0xFFDBB4A4), hintColor: Colors.white);
}
