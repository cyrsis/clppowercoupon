import 'package:clppowercoupon/Styles/AppStyleExport.dart';
import 'package:flutter/material.dart';

class CodeForRedeemScreen extends StatefulWidget {
  CodeForRedeemScreen({Key key}) : super(key: key);

  @override
  _CodeForRedeemScreenState createState() => new _CodeForRedeemScreenState();
}

class _CodeForRedeemScreenState extends State<CodeForRedeemScreen> {
  var _listofQR = [];

  @override
  Widget build(BuildContext context) {
    final TextEditingController barcodeController = TextEditingController();

    return new Scaffold(
      appBar: AppAppBar.TopAppBar,
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AppWidget.SizeBoxH32,
            Padding(
              padding: AppPadding.All20,
              child: TextFormField(
                onFieldSubmitted: (value) {
                  _listofQR.add(value);
                  barcodeController.text = "";

                  setState(() {});
                },
                controller: barcodeController,
                decoration: const InputDecoration(labelText: 'Barcode Number'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter barcode Number';
                  }
                  return null;
                },
                obscureText: false,
              ),
            ),
            AppWidget.SizeBoxH32,
          ]..addAll(_listofQR.map<Widget>((e) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text('${e}'),
                  AppWidget.SizeBoxW10,
                  new Text(
                    'Valild',
                    style: AppStyle.Avenir24DarkGreenChange,
                  ),
                ],
              )))),
    );
  }
}
