import 'package:clppowercoupon/Styles/AppStyleExport.dart';
import 'package:flutter/material.dart';

import 'Bloc/BarcodeScanBlog/TestBarCodeScanScreen.dart';
import 'CodeForRedeemScreen.dart';
import 'Styles/AppStyle.dart';

class OperationMenuScreen extends StatefulWidget {
  OperationMenuScreen({Key key}) : super(key: key);

  @override
  _OperationMenuScreenState createState() => new _OperationMenuScreenState();
}

class _OperationMenuScreenState extends State<OperationMenuScreen> {
  var _space = AppWidget.SizeBoxH32;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _space,
              new Text("Operator App", style: AppStyle.Avenir24Black),
              _space,
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new TestBarCodeScanScreen(),
                        settings: RouteSettings(name: 'SomeScreen'),
                      ));
                },
                child: new Container(
                  width: 200.0,
                  height: 80.0,
                  alignment: Alignment.center,
                  padding: new EdgeInsets.all(12.0),
                  decoration: new BoxDecoration(
                    color: AppColors.BlackLight,
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Text(
                    'Scan to Redeem',
                    style: AppStyle.f16White,
                  ),
                ),
              ),
              _space,
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new CodeForRedeemScreen(),
                        settings: RouteSettings(name: 'SomeScreen'),
                      ));
                },
                child: new Container(
                  width: 200.0,
                  height: 80.0,
                  alignment: Alignment.center,
                  padding: new EdgeInsets.all(12.0),
                  decoration: new BoxDecoration(
                    color: AppColors.AlphaDark,
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Text('Code for Redeem', style: AppStyle.f16White),
                ),
              ),
              _space,
              new Container(
                width: 200.0,
                height: 80.0,
                alignment: Alignment.center,
                padding: new EdgeInsets.all(12.0),
                decoration: new BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: new Text('Redeem Log Within 24 hours',
                    textAlign: TextAlign.center, style: AppStyle.f16White),
              ),
            ]),
      ),
    );
  }
}
