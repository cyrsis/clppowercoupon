import 'package:flutter/material.dart';

class AppInputDecoration {
  //当输入框是空而且没有焦点时，labelText显示在输入框上边，当获取焦点或者不为空时labelText往上移动一点，labelStyle参数表示文本样式，具体参考TextStyle， 用法如下：
  static get BasicLabelRed => InputDecoration(
      labelText: '姓名：', labelStyle: TextStyle(color: Colors.red));

  //helperText显示在输入框的左下部，用于提示用户，helperStyle参数表示文本样式，具体参考TextStyle用法如下：
  static get BasicHelperBlue => InputDecoration(
      helperText: '用户名长度为6-10个字母',
      helperStyle: TextStyle(color: Colors.blue),
      helperMaxLines: 1);

  static get BasicErrorRed => InputDecoration(
        errorText: '用户名输入错误',
        errorStyle: TextStyle(fontSize: 12),
        errorMaxLines: 1,
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      );

  static get BasicPerfixSuffix => InputDecoration(
      prefixIcon: Icon(Icons.person), suffixIcon: Icon(Icons.person));


  static get CounterText => InputDecoration(
      counterText: "/32",
      prefixIcon: Icon(Icons.person), suffixIcon: Icon(Icons.person));

  static get QQStyle =>InputDecoration(
    fillColor: Color(0x30cccccc),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x00FF0000)),
        borderRadius: BorderRadius.all(Radius.circular(100))),
    hintText: 'QQ号/手机号/邮箱',
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x00000000)),
        borderRadius: BorderRadius.all(Radius.circular(100))),
  );

}
