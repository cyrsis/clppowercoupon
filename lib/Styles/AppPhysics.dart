import 'package:flutter/material.dart';

class AppPhysics {
  
static get FixExtend =>FixedExtentScrollPhysics(); //only scrolls to items instead of any offset in between.
static get ClampingScroll =>ClampingScrollPhysics(); //Android style
static get BouncingScroll =>BouncingScrollPhysics(); //IOS Style ,
static get NeverScroll =>NeverScrollableScrollPhysics(); //IOS Style ,

}