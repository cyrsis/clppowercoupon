import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
import './AppStyleExport.dart';
import './Widget/Dots.dart';
import 'AppFormat.dart';
import 'Widget/OffSetText.dart';
import 'Widget/StarDisplayStateful.dart';
import 'Widget/StarDisplayWidget.dart';

//Container with ubound -> Column  = As SMALL as possible
//Container with bound ->Scaffold = As Big as possible
//Container WANT TO BE AS BIG AS POSSIBLE = double.infinity

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

class AppWidget extends StatelessWidget {
  static get OffSetText =>
      Container(width: 600.0, height: 200.0, child: OffSetTextWidget());

  static levelIndicator(lesson) => Container(
        child: Container(
          child: LinearProgressIndicator(
              backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
              value: lesson.indicatorValue,
              valueColor: AlwaysStoppedAnimation(Colors.green)),
        ),
      );

  static DeliverooCard(
          {imageUrl =
              "https://cdn.pixabay.com/photo/2017/05/25/15/08/jogging-2343558_960_720.jpg",
          text = "20 mins",
          title = "Jogging",
          subtitle = "Lorem "}) =>
      Center(
        child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      new Container(
                          padding: const EdgeInsets.only(
                              top: 0.5, left: 0.5, right: 0.5, bottom: 20),
                          child: new ClipRRect(
                            borderRadius: AppBorderRadius.Circle10,
                            child: new Image.network(
                              '${imageUrl}',
                              fit: BoxFit.cover,
                            ),
                          )),
                      new Positioned(
                        right: 30.0,
                        bottom: 0.0,
                        child: new Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: AppDecoration.BorderRadius60White,
                          child: new Text(
                            '${text}',
                            style: new TextStyle(
                                fontFamily: "",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: AppPadding.All2_5,
                    child: new Text(
                      '${title}',
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppPadding.All2_5,
                    child: new Text(
                      '${subtitle}',
                    ),
                  ),
                ])),
      );

  static SpotifyCard(context, {String title, String imgUrl}) {
    return Material(
      elevation: 1.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.indigo,
        ),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              top: 15,
              left: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                child: Text(
                  title,
                  style: GoogleFonts.rubik(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              right: -15,
              top: 15,
              child: Transform.rotate(
                angle: pi / 10,
                child: Material(
                  elevation: 4,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Buildcards() {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9]
        .map((v) => Container(
              color: Colors.blue,
              margin: EdgeInsets.all(20),
              height: 100,
              child: Text('$v'),
            ))
        .toList();
  }

  static get SettingBody => SingleChildScrollView(
        child: Theme(
          data: ThemeData(fontFamily: AppString.ralewayFont),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //1
              Padding(
                padding: AppPadding.All16,
                child: Text(
                  "General Setting",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      title: Text("Account"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      title: Text("Gmail"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sync,
                        color: Colors.blue,
                      ),
                      title: Text("Sync Data"),
                      trailing: Icon(Icons.arrow_right),
                    )
                  ],
                ),
              ),

              //2
              Padding(
                padding: AppPadding.All16,
                child: Text(
                  "Network",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.sim_card,
                        color: Colors.grey,
                      ),
                      title: Text("Simcard & Network"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.wifi,
                        color: Colors.amber,
                      ),
                      title: Text("Wifi"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.bluetooth,
                        color: Colors.blue,
                      ),
                      title: Text("Bluetooth"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                      title: Text("More"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),

              //3
              Padding(
                padding: AppPadding.All16,
                child: Text(
                  "Sound",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.do_not_disturb_off,
                        color: Colors.orange,
                      ),
                      title: Text("Silent Mode"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.vibration,
                        color: Colors.purple,
                      ),
                      title: Text("Vibrate Mode"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.volume_up,
                        color: Colors.green,
                      ),
                      title: Text("Sound Volume"),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phonelink_ring,
                        color: Colors.grey,
                      ),
                      title: Text("Ringtone"),
                      trailing: Icon(Icons.arrow_right),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  static get CurvedAppbar => new AppBar(
        shape: const MyShapeBorder(curveHeight: 50),
      );

  static get DraggableCustomPainterWidget => DraggableCustomPainter();

  static get IOSPicker => CupertinoPicker(
          backgroundColor: Color(0xFFF6F5E8),
          diameterRatio: 1.5,
          itemExtent: 30,
          onSelectedItemChanged: (position) {
            print('The position is $position');
          },
          children: [
            Text("Some Text 1"),
            Text("Some Text "),
            Text("Some Text 11"),
            Text("Some Text 12"),
            Text("Some Text 13"),
            Text("Some Text 14"),
          ]);

  static get StarStateful => StatefulStarRating();

  static get ListViewSeperated => ListView.separated(
        //ListView.builder is essentially a ListView.custom with a SliverChildBuilderDelegate.

        itemBuilder: (context, position) {
//      return ListItem();
        },
        separatorBuilder: (context, position) {
//      return SeparatorItem();
        },
        itemCount: 2,
//    itemCount: itemCount,
      );

  static get ListViewBuilderExample => ListView.builder(
        itemBuilder: (context, position) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                position.toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          );
        },
      );

  static get AppBarEmpty => AppBar();

  static AppBarTitleWhite(text) => AppBar(
        title: Text(
          '${text}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0,
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
      );

  ////-------- StreamWidge -------

  ////-------- Dialog -------

  ////-------- Screen Transition -------
  static get StarDisplay => StarDisplayWidget(
        value: 0,
        filledStar: Icon(Icons.star, color: Colors.yellow, size: 32),
        unfilledStar: Icon(Icons.star, color: Colors.grey),
      );

  static get SizedBoxH50 => SizedBox(
        height: 50,
      );

  static Route<Object> TransitionEnterExitRoute({enterPage, exitPage}) =>
      EnterExitRoute(enterPage: enterPage, exitPage: exitPage);

  static Route<Object> TransitionScaleRotateRoute({page}) =>
      ScaleRotateRoute(page: page);

  static Route<Object> TransitionFadeRoute({page}) => FadeRoute(page: page);

  static Route<Object> TransitionRotationRoute({page}) =>
      RotationRoute(page: page);

  static Route<Object> TransitionScaleRoute({page}) =>
      ScaleRotateRoute(page: page);

  static Route<Object> TransitionSlideRightRoute({page}) =>
      SlideRightRoute(page: page);

  static Route<Object> TransitionSlideLeftRoute({page}) =>
      SlideLeftRoute(page: page);

  static Route<Object> TransitionSlideTopRoute({page}) =>
      SlideTopRoute(page: page);

  static Route<Object> TransitionSlideBottomRoute({page}) =>
      SlideBottomRoute(page: page);

  static Route<Object> TransitionSizeRoute({page}) => SizeRoute(page: page);

  ////-------- Map Bloc Widget -------

  ////-------- Firebase Author Bloc Widget -------

  //UI Base Widget

  //Rating bar

  static get EmptyContainerExppaned => Container(
        width: 0.0,
        height: 0.0,
      );

  static get NoCameraFoundWhiteText => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No Camera Found',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      );

  static get FlexFlexible2To1Example => new Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: new Container(
              color: Colors.blue,
              height: 60.0,
              alignment: Alignment.center,
              child: const Text('left!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  textDirection: TextDirection.ltr),
            ),
          ),
          new Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: new Container(
              color: Colors.red,
              height: 60.0,
              alignment: Alignment.center,
              child: const Text('right',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  textDirection: TextDirection.ltr),
            ),
          ),
        ],
      );

  static get ContainerTrasparentRoundCorner => new Container(
        height: 300.0,
        color: Colors.transparent,
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0))),
            child: new Center(
              child: new Text("Hi modal sheet"),
            )),
      );

  static DividerFull(height, tickness, color, indent, endindent) => Divider(
        height: height,
        thickness: tickness,
        color: color,
        indent: indent,
        endIndent: endindent,
      );

  static get Divider10Red => Divider(
        height: 10,
        thickness: 5,
        color: Colors.red,
        indent: 10,
        endIndent: 20,
      );

  static get Divider16 => new Divider(
        height: 8.0,
        color: Colors.blue,
      );

  static get Divider1White => new Divider(
        height: 1.0,
        color: Colors.white,
      );

  static get Divider1Grey => new Divider(
        height: 0.5,
        color: Color(0xffd8d8d8),
      );

  static Divider1GreyWidth(double width) => new Container(
        width: width,
        child: AppWidget.Divider1Grey,
      );

  static get Divider8 => new Divider(
        height: 8.0,
      );

  static Widget get LoadingExpanded =>
      Expanded(child: Center(child: CircularProgressIndicator()));

  static Widget get LoadingAlwaysStoppedAnimationWiget => new Center(
          child: Center(
        child: new CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
      ));

  static get SizeBoxH350 => Container(height: 350.0);

  static get SizeBoxH85 => SizedBox(height: 85.0);

  static get SizeBoxH120 => SizedBox(height: 130.0);

  static get SizeBoxH160 => SizedBox(height: 160.0);

  static get SizeBoxH1 => SizedBox(height: 1.0);

  static get SizeBoxH2 => SizedBox(height: 2.0);

  static get SizeBoxH5 => SizedBox(height: 5.0);

  static get SizeBoxH4 => SizedBox(height: 4.0);

  static get SizeBoxH7 => SizedBox(height: 7.0);

  static get SizeH140 => SizedBox(height: 140);

  static get SizeBoxH115 => SizedBox(height: 115.0);

  static get SizeBoxH130 => SizedBox(height: 130.0);

  static get SizeBoxH140 => SizedBox(height: 140.0);

  static get SizeBoxH150 => SizedBox(height: 150.0);

  static get SizeBoxH180 => SizedBox(height: 180.0);

  static get ExpandEmptyContainer => Expanded(
        child: new Container(),
      );

  static get ExpandFlex2 => Expanded(
        flex: 2,
        child: new Container(),
      );

  static get ExpandFlex3 => Expanded(
        flex: 3,
        child: new Container(),
      );

  //Note:A Custom Scroll View allows you to use Slivers which essentially is a section of a viewport,
  // meaning you can have a scrollable page consisting of different widgets.
  //Tip :- To use a Normal Widget in slivers just use a SliverToBoxAdapter().

  static MessageWiget(
          {message,
          style: const TextStyle(color: Colors.black, fontSize: 28.0)}) =>
      Expanded(
        child: Center(
          child: Text(
            message,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      );

  static get SpacerWidget => Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
            ],
          ),
        ),
      );

  static get WrapWidget => Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              )
            ],
          ),
        ),
      );

  static showOverlayExample(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 200.0,
        height: 40.0,
        left: 30.0,
        right: 30.0,
        child: Material(
          color: Colors.red,
          shape: StadiumBorder(),
          child: Padding(
            padding: AppPadding.All8,
            child: Text(
              "Boring Show",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

// OverlayEntry overlayEntry = OverlayEntry(
//         builder: (context) => Positioned(
//               top: MediaQuery.of(context).size.height / 2.0,
//               width: MediaQuery.of(context).size.width / 2.0,
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundColor: Colors.red,
//                 child: Text("1"),
//               ),
//             ));
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  static get CupertionPageScaffoldExample => CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Chats"),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text("WhatsApp"),
              ),
            )
          ],
        ),
      );

  static get CupertinoTabScaffoldExample => CupertinoTabScaffold(
        tabBuilder: (context, i) => CupertinoPageScaffold(
          child: Center(
            child: i == 0 ? Text("Phone") : Text("Chat"),
          ),
        ),
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), title: Text("Phone")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.conversation_bubble),
                title: Text("Chat"))
          ],
        ),
      );

  static get CupertionPageScaffoldBottomNavExample => CupertinoPageScaffold(
        child: Center(
          child: Text("Hello Cupertino iOS"),
        ),
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.back),
          middle: Text("Cupertino"),
          trailing: Icon(CupertinoIcons.search),
        ),
      );

  static get BannerWiget => Center(
        child: Banner(
          child: Container(
            color: Colors.green,
            child: Image.asset("graphics/boringshow.jpg"),
            height: 200.0,
          ),
          location: BannerLocation.bottomEnd,
          message: "Boring Show",
          color: Colors.pink,
        ),
      );

  static SizedBoxFromSizeWidget(context) => Container(
        //Sized Box with fromSize constructor to give directly the size
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size / 10.0,
        ),
      );

  static get SizedBoxExpandWidget => //SizedBox with Expand constructor so that
      // it can expand to its parent width & height
      Container(
        height: 200.0,
        width: 200.0,
        child: SizedBox.expand(
          child: FlutterLogo(),
        ),
      );

  static get SizedOverflowBoxWidget =>
      //SizedOverflowbox to allow its child
      // to overflow or expand more than its parent size.
      Container(
        child: SizedOverflowBox(
            size: Size(50.0, 50.0),
            child: Text("Three", style: TextStyle(fontSize: 25.0))),
      );

  static get FractionallySizeBoxWidget =>
      //Fractional Sized box to give ration for the child
      // to adjust depending on its parent size
      new Container(
        height: 100.0,
        width: 100.0,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: FlutterLogo(),
        ),
      );

  static get DrawerWigetExample => new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Victor Tong",
              ),
              accountEmail: Text(
                "victor.tong@blockmanic.com",
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage(AppString.pkImage),
              ),
            ),
            new ListTile(
              title: Text(
                "Profile",
                style: AppStyle.F18Bold,
              ),
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: Text(
                "Shopping",
                style: AppStyle.F18Bold,
              ),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
            ),
            new ListTile(
              title: Text(
                "Dashboard",
                style: AppStyle.F18Bold,
              ),
              leading: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
            ),
            new ListTile(
              title: Text(
                "Timeline",
                style: AppStyle.F18Bold,
              ),
              leading: Icon(
                Icons.timeline,
                color: Colors.cyan,
              ),
            ),
            Divider(),
            new ListTile(
              title: Text(
                "Settings",
                style: AppStyle.F18Bold,
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.brown,
              ),
            ),
            Divider(),
            AppWidget.AboutScreen
          ],
        ),
      );

  static get ImageBlurBackDropFilterPostion => Positioned(
      top: 100,
      bottom: 150,
      left: 150,
      right: 100,
      child: new BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: new Container(
          color: Colors.black.withOpacity(0),
        ),
      ));

  static get ImageBlurBackDropFilterPostionFill => Positioned.fill(
          //InSide of the stack
          child: new BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: new Container(
          color: Colors.black.withOpacity(0),
        ),
      ));

  static get SpeechBubbleRowRed => Container();

//  static get SpeechBubbleRowRed => new SpeechBubble(
//        color: Colors.redAccent,
//        nipLocation: NipLocation.BOTTOM,
//        child: Row(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Icon(
//              Icons.favorite,
//              color: Colors.white,
//            ),
//            Padding(
//              padding: const EdgeInsets.all(4.0),
//            ),
//            Text(
//              "1",
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18.0,
//              ),
//            ),
//          ],
//        ),
//      );

  static get SpeechBubbleColumnTwoTextWhite => new Container();

  static get AppMusicCard => new Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 0.0,
      child: new Container(
        height: 500.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          // the box shawdow property allows for fine tuning as aposed to shadowColor
          boxShadow: [
            new BoxShadow(
                color: Color(0xFFFFAFBD),
                // offset, the X,Y coordinates to offset the shadow
                offset: new Offset(0.0, 10.0),
                // blurRadius, the higher the number the more smeared look
                blurRadius: 30.0,
                spreadRadius: 4.0)
          ],
        ),
        // child: Text("This is where your content goes")
      ));

  static get CardShadow => new Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 0.0,
      child: new Container(
        height: 500.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          // the box shawdow property allows for fine tuning as aposed to shadowColor
          boxShadow: [
            new BoxShadow(
                color: Color(0xFFFFAFBD),
                // offset, the X,Y coordinates to offset the shadow
                offset: new Offset(0.0, 10.0),
                // blurRadius, the higher the number the more smeared look
                //spreadRadius broadened up the shadow and the blurRadius increase made for a more fuzzy cotton candy look.
                blurRadius: 30.0,
                spreadRadius: 4.0)
          ],
        ),
        // child: Text("This is where your content goes")
      ));

  static get InstagramPost => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://pbs.twimg.com/profile_images/877903823133704194/Mqp1PXU8_400x400.jpg"))),
                      ),
                      AppWidget.SizeBoxW10,
                      Text(
                        "The Verge",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ]),
          ),
          Container(
            child: Image.network(
              "https://scontent-bom1-1.cdninstagram.com/vp/bbe7af06973ff08e40c46e78b6dbae1b/5CD2BC37/t51.2885-15/e35/49480120_356125811610205_2312703144893486280_n.jpg?_nc_ht=scontent-bom1-1.cdninstagram.com",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                    SizedBox(width: 16.0),
                    Icon(FontAwesomeIcons.comment),
                    SizedBox(width: 16.0),
                    Icon(FontAwesomeIcons.paperPlane)
                  ],
                ),
                Icon(FontAwesomeIcons.bookmark)
              ],
            ),
          ),
        ],
      );

  static get BottomAppBar4Tabs => BottomAppBar(
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {},
            )
          ],
        ),
      );

  //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  static get FabLocation => FloatingActionButton(
        backgroundColor: Colors.black,
        child: new Icon(Icons.add),
        onPressed: () {},
        shape: new BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
      );

  static get SilverAppBarWithGradientPinned => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppColors.kitGradients)),
          ),
          title: Row(
            children: <Widget>[
              FlutterLogo(
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(AppString.appName)
            ],
          ),
        ),
      );

  //The App bar is set as pinned, so that it remains static even while scrolling up/down, but this can be changed for some interesting UI/UX.
  static get SilverAppbar2 => SliverAppBar(
        pinned: true,
        backgroundColor: new Color(0xfff8faf8),
        elevation: 0.0,
        centerTitle: true,
        title: SizedBox(
          height: 35.0,
          child: Image.asset("assets/images/insta_logo.png"),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
      );

  //Sized Box with fromSize constructor to give directly the size
  static RandomBoxContext(context) => Container(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size / 10.0,
        ),
      );

  static get RadomContainer => Container(
        height: 200.0,
        width: 200.0,
        child: SizedBox.expand(
          child: FlutterLogo(),
        ),
      );

  //normal Sized box with height and width
  static get SizeBoxNoraml => SizedBox(
        width: 100.0,
        height: 100.0,
        child: Container(),
      );

  static PlayButton(video) => new Material(
        color: Colors.black87,
        type: MaterialType.circle,
        child: new InkWell(
          onTap: () async {
            // if (await canLaunch(video.url)) {
            //   await launch(video.url);
            // }
          },
          child: new Padding(
            padding: AppPadding.All8,
            child: new Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
      );

  static CardIconText(BuildContext context) {
    return new Card(
        color: Colors.transparent,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.warning, size: 128.0),
              new Text("Here is the new Card",
                  style: AppStyle.ThemeDisplay1(context)),
            ],
          ),
        ));
  }

  static get CustomeRedDot => Container(
          child: new Directionality(
        textDirection: TextDirection.ltr,
        child: Dots(
          child: Center(
            child: Text('Touch me!'),
          ),
        ),
      ));

  static get AboutScreen => new AboutListTile(
        applicationIcon: FlutterLogo(),
        icon: FlutterLogo(),
        aboutBoxChildren: <Widget>[
          AppWidget.SizeBoxH10,
          Text(
            "Developed By Victor Tong",
          ),
          Text(
            "MTechViral",
          ),
        ],
        applicationName: "AppName",
        applicationVersion: "1.0.1",
        applicationLegalese: "Apache License 2.0",
      );

  static get CallMe => new Center(
        child: new FlatButton(
            // onPressed: () => launch("tel://21213123123"),
            child: new Text("Call me", style: AppStyle.MainTextStyle)),
      );

  static get ButtonFollow => FlatButton(
        shape: AppShape.RoundBorderRadius7,
        color: Colors.grey,
        onPressed: () {},
        child: Text(
          'Following',
          style: AppStyle.Comfortaa15BWhiteBoldwhite,
        ),
      );

  static get ButtonFollowIcon => new Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('FOLLOW', style: AppStyle.Montserrat10White),
            new Icon(
              Icons.people,
              size: 10.0,
              color: Colors.white,
            )
          ],
        ),
      );

  static get ButtonFollowingIcon => new Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('FOLLOWING', style: AppStyle.Montserrat10White),
            new Icon(
              Icons.check,
              size: 10.0,
              color: Colors.white,
            )
          ],
        ),
      );

  static get DividerExpaned => new Row(
        children: <Widget>[
          Expanded(
              child: new Divider(height: 2.0, color: AppColors.AlphaDarkGary))
        ],
      );

  static get VerticalDividerW20Red => VerticalDivider(
        width: 20,
        thickness: 2,
        color: Colors.red,
        indent: 10,
        endIndent: 30,
      );

  static get VerticalDividerLineDarkH11 => new Container(
        width: 1.0,
        height: 11.0,
        color: AppColors.LineDark,
      );

  static get VerticalDividerLineDarkH38 => new Container(
        width: 1.0,
        height: 38.0,
        color: AppColors.LineDark,
      );

  static get VerticalDividerLineDark12Blue => new Container(
        width: 2.0,
        height: 12.0,
        color: Color(0xFF627FFF),
      );

  static get VerticalDividerLineDarkH66 => new Container(
        width: 1.0,
        height: 66.0,
        color: AppColors.LineDark,
      );

  static get VerticalDivider35LineDark => new Container(
        width: 1.0,
        height: 35.0,
        color: AppColors.LineDark,
      );

  static get VerticalDividerWhite => new Container(
        height: 30.0,
        width: 1.0,
        color: Colors.white30,
        margin: AppPadding.SymmetricH20V10,
      );

  static get VerticalDividerShadow => new Container(
        width: 2.0,
        height: 70.0,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.black12,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      );

  static get SizeBoxW2 => SizedBox(width: 2.0);

  static SizeBoxW(double W) => SizedBox(width: W);

  static SizeBoxH(double H) => SizedBox(height: H);

  static get SizeBoxW3 => SizedBox(width: 3.0);

  static get SizeBoxW10 => SizedBox(width: 10.0);

  static get SizeBoxW11 => SizedBox(width: 11.0);

  static get SizeBoxW5 => SizedBox(width: 5.0);

  static get SizeBoxW6 => SizedBox(width: 6.0);

  static get SizeBoxW7 => SizedBox(width: 7.0);

  static get SizeBoxW8 => SizedBox(width: 8.0);

  static get SizeBoxW15 => SizedBox(width: 15.0);

  static get SizeBoxW25 => SizedBox(width: 25.0);

  static get SizeBoxW20 => SizedBox(width: 20.0);

  static get SizeBoxW30 => SizedBox(width: 30.0);

  static get SizeBoxW40 => SizedBox(width: 40.0);

  static get SizeBoxW41 => SizedBox(width: 41.0);

  static get SizeBoxW21 => SizedBox(width: 21.0);

  static get SizeBoxW50 => SizedBox(width: 50.0);

  static get SizeBoxW59 => SizedBox(width: 59.0);

  static get SizeBoxW60 => SizedBox(width: 60.0);

  static get SizeBoxW80 => SizedBox(width: 80.0);

  static get SizeBoxW100 => SizedBox(width: 100.0);

  static get SizedBoxH2 => SizedBox(height: 2.0);

  static get SizeBoxH3 => SizedBox(height: 3.0);

  static get SizeBoxH8 => SizedBox(height: 8.0);

  static get SizeBoxH9 => SizedBox(height: 9.0);

  static get SizeBoxH10 => SizedBox(height: 10.0);

  static get SizeBoxH12 => SizedBox(height: 12.0);

  static get SizeBoxH14 => SizedBox(height: 14.0);

  static get SizeBoxH16 => AppWidget.SizeBoxH16;

  static get SizeBoxH17 => SizedBox(height: 17.0);

  static get SizeBoxH18 => SizedBox(height: 18.0);

  static get SizeBoxH24 => SizedBox(height: 24.0);

  static get SizeBoxH25 => SizedBox(height: 25.0);

  static get SizeBoxH15 => SizedBox(height: 15.0);

  static get SizeBoxH33 => SizedBox(height: 33.0);

  static get SizeBoxH32 => SizedBox(height: 32.0);

  static get SizeBoxH20 => SizedBox(height: 20.0);

  static get SizeBoxH22 => SizedBox(height: 22.0);

  static get SizeBoxH30 => SizedBox(height: 30.0);

  static get SizeBoxH36 => SizedBox(height: 36.0);

  static get SizeBoxH37 => SizedBox(height: 37.0);

  static get SizeBoxH38 => SizedBox(height: 38.0);

  static get SizeBoxH40 => SizedBox(height: 40.0);

  static get SizeBoxH42 => SizedBox(height: 42.0);

  static get SizeBoxH43 => SizedBox(height: 43.0);

  static get SizeBoxH44 => SizedBox(height: 44.0);

  static get SizeBoxH45 => SizedBox(height: 45.0);

  static get SizeBoxH46 => SizedBox(height: 46.0);

  static get SizeBoxH49 => SizedBox(height: 49.0);

  static get SizeBoxH50 => SizedBox(height: 50.0);

  static get SizeBoxH54 => SizedBox(height: 54.0);

  static get SizeBoxH52 => SizedBox(height: 52.0);

  static get SizeBoxH57 => SizedBox(height: 57.0);

  static get SizeBoxH60 => SizedBox(height: 60.0);

  static get SizeBoxH70 => SizedBox(height: 77.0);

  static get SizeBoxH71 => SizedBox(height: 71.0);

  static get SizeBoxH173 => SizedBox(height: 173.0);

  static get SizeBoxH100W100 => SizedBox(width: 100.0, height: 100.0);

  static get SizedBoxBarheight => SizedBox(height: kTextTabBarHeight);

  static get FontAwesomeIcon => new Icon(FontAwesomeIcons.globe);

  static BuildRatedStar(int rating, int index) {
    if (index <= rating) {
      return Icon(Icons.star, size: 9.0, color: Colors.yellow[600]);
    } else {
      return Icon(Icons.star, size: 9.0, color: Colors.grey);
    }
  }

  static get PostCard => new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://pbs.twimg.com/profile_images/877903823133704194/Mqp1PXU8_400x400.jpg"))),
                      ),
                      AppWidget.SizeBoxW10,
                      Text(
                        "The Verge",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  )
                ]),
          ),
          Container(
            child: Image.network(
              "https://scontent-bom1-1.cdninstagram.com/vp/bbe7af06973ff08e40c46e78b6dbae1b/5CD2BC37/t51.2885-15/e35/49480120_356125811610205_2312703144893486280_n.jpg?_nc_ht=scontent-bom1-1.cdninstagram.com",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                    SizedBox(width: 16.0),
                    Icon(FontAwesomeIcons.comment),
                    SizedBox(width: 16.0),
                    Icon(FontAwesomeIcons.paperPlane)
                  ],
                ),
                Icon(FontAwesomeIcons.bookmark)
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  static RoundButtonW225H46W2Text(
      borderRadius10Green, buttonText, noteText1, noteText2, Action) {
    return new Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Action();
          },
          child: new Container(
            width: 225.0,
            height: 46.0,
            alignment: Alignment.center,
            decoration: borderRadius10Green,
            child: new Text(
              buttonText,
              style: TextStyle(
                fontSize: 19.76,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        AppWidget.SizeBoxH7,
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Note with one",
              style: TextStyle(
                fontSize: 11.34,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                color: Color(0xFFFFFFFF),
              ),
            ),
            new Text(
              "or two lines of text",
              style: TextStyle(
                fontSize: 11.34,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                color: Color(0xFFFFFFFF),
              ),
            ),
            AppWidget.SizeBoxH20,
          ],
        )
      ],
    );
  }

  static ShowOverlayWidget(context) => (BuildContext context) async {
        OverlayState overlayState = Overlay.of(context);
        OverlayEntry overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: 200.0,
            height: 40.0,
            left: 30.0,
            right: 30.0,
            child: Material(
              color: Colors.red,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );

// OverlayEntry overlayEntry = OverlayEntry(
//         builder: (context) => Positioned(
//               top: MediaQuery.of(context).size.height / 2.0,
//               width: MediaQuery.of(context).size.width / 2.0,
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundColor: Colors.red,
//                 child: Text("1"),
//               ),
//             ));
        overlayState.insert(overlayEntry);

        await Future.delayed(Duration(seconds: 2));

        overlayEntry.remove();
      };

  static get SpacerSample => Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
            ],
          ),
        ),
      );

  static get WrapRow => Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  "Boring Show",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              )
            ],
          ),
        ),
      );

  static get FittedBoxExample => Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Boring Show",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Boring Show",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Boring Show",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Boring Show",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Boring Show",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      );

  static HeaderWidgetSimple(String header) => Container(
        padding: EdgeInsets.all(16.0),
        child: Text(header),
        color: Colors.grey[200],
      );

  static BodyWidgetSimple(Color color) => Container(
        height: 100.0,
        color: color,
        alignment: Alignment.center,
      );
}

class DraggableCustomPainter extends StatefulWidget {
  @override
  _DraggableCustomPainterState createState() => _DraggableCustomPainterState();
}

class _DraggableCustomPainterState extends State<DraggableCustomPainter> {
  var xPos = 0.0;
  var yPos = 0.0;
  final width = 100.0;
  final height = 100.0;
  bool _dragging = false;
  final _paint = Paint();

  /// Is the point (x, y) inside the rect?
  bool _insideRect(double x, double y) =>
      x >= xPos && x <= xPos + width && y >= yPos && y <= yPos + height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) => _dragging = _insideRect(
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      onPanEnd: (details) {
        _dragging = false;
      },
      onPanUpdate: (details) {
        if (_dragging) {
          setState(() {
            xPos += details.delta.dx;
            yPos += details.delta.dy;
          });
        }
      },
      child: Container(
        child: CustomPaint(
          painter: RectanglePainter(
            rect: Rect.fromLTWH(xPos, yPos, width, height),
            painter: _paint,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  RectanglePainter({
    @required this.rect,
    @required this.painter,
  });

  final Rect rect;
  final Paint painter;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(rect, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder({double this.curveHeight});

  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}

class PaidCard extends StatefulWidget {
  final String time, date, name, typeOfService, duration, noOfProducts;
  final double cost;

  PaidCard(
      {this.time = '10:00 - 11:00 AM',
      this.date = "Monday, August 19",
      this.name = 'Alexander Anderson',
      this.typeOfService = "Women's cut",
      this.duration = '1 hr',
      this.noOfProducts = '+2 Products',
      this.cost = 80.00});

  @override
  _PaidCardState createState() => _PaidCardState();
}

class _PaidCardState extends State<PaidCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 5.0,
            right: 70.0,
            width: 120.0,
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.cardlibs_paid),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.time,
                          style: AppStyle.boldBlack16TextStyle,
                        ),
                        Text(
                          widget.date,
                          style: AppStyle.normalGrey14TextStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipOval(
                      child: Image.asset(
                        AppImage.cardlibs_profile_pic,
                        fit: BoxFit.cover,
                        height: 45.0,
                        width: 45.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: AppStyle.boldBlack16TextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.typeOfService.toUpperCase(),
                              style: AppStyle.normalGrey14TextStyle,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1.0),
                                ),
                                border: Border.all(color: AppStyle.greyColor),
                              ),
                              child: Text(
                                widget.duration,
                                style: AppStyle.normalGrey14TextStyle,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      AppFormat.simpleFormat(widget.cost),
                      style: AppStyle.boldPurple16TextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.noOfProducts,
                  style: AppStyle.boldPurple16TextStyle,
                ),
              ),
              AppWidget.SizeBoxH16,
              Divider(
                color: Colors.black,
                height: 0.0,
              ),
              Container(
                color: Colors.white,
                padding: AppPadding.All12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Schedule Again'.toUpperCase(),
                      style: AppStyle.boldGreen16LargeTextStyle,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
