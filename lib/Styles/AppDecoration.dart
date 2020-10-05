import 'package:flutter/material.dart';
import './AppStyle.dart';

import './AppBorder.dart';
import './AppColors.dart';
import './AppGradient.dart';
import './AppImage.dart';

class AppDecoration {
  static BoxShadowBlackOffSetBoreder(radus) => BoxDecoration(
        //color: Colors.red[400],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xEE000000),
            offset: Offset(0.0, 6.0),
            blurRadius: radus,
          ),
        ],
      );

  static get BoxShadowBlackOffSet => BoxDecoration(
        //color: Colors.red[400],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xEE000000),
            offset: Offset(0.0, 6.0),
            blurRadius: 10.0,
          ),
        ],
      );

  static get BorderRadius10BoxShadowBlackRadius => BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 2.0),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.0),
        BoxShadow(
            offset: Offset(0, 1.0),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3.0)
      ],
      color: Colors.white);

  static get BoxShadowBlack => BoxDecoration(
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 2.0),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.0),
        BoxShadow(
            offset: Offset(0, 1.0),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3.0)
      ], color: Colors.white);

  static get BorderAll12Green => BoxDecoration(
        border: Border.all(color: Color(0xFF1DF093), width: 12.0),
      );

  static get BorderAll12Yellow => BoxDecoration(
        border: Border.all(color: Color(0xfff0e889), width: 12.0),
      );

  static get BorderAll5Grey => BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      );

  static get BorderRight => BoxDecoration(
      // 下滑线浅灰色，宽度1像素
      border: Border(right: BorderSide(color: Color(0xFFC5C5C5), width: 1.0)));

  static get BorderBottom => BoxDecoration(
      // 下滑线浅灰色，宽度1像素
      border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0)));

  static get BorderBottomPoint33 => BoxDecoration(
      // 下滑线浅灰色，宽度1像素
      border: Border(bottom: BorderSide(color: Colors.grey[200], width: 0.33)));

  static get ShapeDecoration => ShapeDecoration(
        color: Colors.white,
        shape: Border.all(
              color: Colors.red,
              width: 8.0,
            ) +
            Border.all(
              color: Colors.green,
              width: 8.0,
            ) +
            Border.all(
              color: Colors.blue,
              width: 8.0,
            ),
      );

  static get RadialGradientTitleMode => new BoxDecoration(
        color: Colors.purple,
        gradient: new RadialGradient(
            colors: [
              Colors.red,
              Colors.cyan,
              Colors.purple,
              Colors.lightGreenAccent
            ],
            center: Alignment(-0.7, -0.6),
            radius: 0.2,
            //Whatever times in here
            tileMode: TileMode.clamp,
            stops: [0.3, 0.5, 0.6, 0.7]),
      );

  static get LinearGradientOrgane => BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.OrangefirstColor, AppColors.OrangesecondColor],
        ),
      );

  static get LinearGradientTopToBottomWhiteWhiteDark => new BoxDecoration(
          gradient: new LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
          Colors.black12,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ));

  static get LinearGradientTopBottomClamp => new BoxDecoration(
      gradient: LinearGradient(
          colors: [Color(0xFF696D77), Color(0xFF292C36)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp));

  static get LinearGradienBottomToTopDarkText => BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.black,
            Colors.black.withOpacity(0.1),
            Colors.white30
          ]));

  static get LinearGradientDarkText => BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.black,
            Colors.black.withOpacity(0.1),
          ]));

  static get LinerarGradientTileMode => new BoxDecoration(
      color: Colors.purple,
      gradient: new LinearGradient(
          colors: [Colors.red, Colors.cyan],
          begin: Alignment.centerRight,
          end: new Alignment(0.8, 0.0),
          tileMode: TileMode.clamp));

  static get LinearGradientCenterRight => new BoxDecoration(
      color: Colors.purple,
      gradient: new LinearGradient(
          colors: [Colors.red, Colors.cyan],
          begin: Alignment.centerRight,
          end: new Alignment(-1.0, -1.0)));

  static get BoxShapeCircleImageWhiteBorder => new BoxDecoration(
      shape: BoxShape.circle,
      image: new DecorationImage(
          image: new AssetImage("assets/profile/emma-watson.jpg"),
          fit: BoxFit.cover),
      border: Border.all(color: Colors.white30, width: 0.5));

  static get BoxShapeCircleDazzlingBlue => new BoxDecoration(
        color: AppColors.DazzlingBlue,
        shape: BoxShape.circle,
      );

  static get BoxShapeCircleWhite => new BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
      );

  static get BoxShapeCircleAlphaPink => new BoxDecoration(
      color: AppColors.AlphaPinkRed,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 3.0));

  static get BorderRadius50Image => BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      image: DecorationImage(
          image: AssetImage(AppImage.chefprofile_chris), fit: BoxFit.cover));

  static get BoxShapeCircleImage => new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
            image: new AssetImage("assets/profile/emma-watson.jpg"),
            fit: BoxFit.cover),
      );

  static get BoxShapeCircleImageWhiteBorder5 => new BoxDecoration(
      shape: BoxShape.circle,
      image: new DecorationImage(
          image: new AssetImage("assets/profile/emma-watson.jpg"),
          fit: BoxFit.cover),
      border: Border.all(color: Colors.white, width: 3.0));

  static get BorderRight1White => new BoxDecoration(
      border:
          new Border(right: new BorderSide(width: 1.0, color: Colors.white24)));

  static get BorderAll => new Border.all(
        //新手建议给每一个组件写一个border
        color: const Color(0xff6d9eeb),
      );

  static get BorderAllBottom1 => new BoxDecoration(
        border: const Border(
          top: const BorderSide(width: 0.0),
          left: const BorderSide(width: 0.0),
          right: const BorderSide(width: 0.0),
          bottom: const BorderSide(width: 1.0, color: Colors.grey),
        ),
      );

  static get BorderRadisAllWImage => new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("assets/profile/emma-watson.jpg"),
            fit: BoxFit.cover),
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0),
        ],
      );

  static get BorderRadius10BrightOrgangeGm => new BoxDecoration(
        color: AppColors.BrightOrgangeGM,
        borderRadius: new BorderRadius.circular(10.0),
      );

  static get BorderRadius10Shadow => new BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 10.0,
            color: Colors.black26,
          ),
        ],
      );

  static get BorderRadius10ShadowGrey => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 2.0,
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2.0)
          ]);

  static get BorderRadius3BrightOrgangeGm => new BoxDecoration(
        color: AppColors.BrightOrgangeGM,
        borderRadius: new BorderRadius.circular(3.0),
      );

  static get BorderRadius3DarkBlue => new BoxDecoration(
        color: AppColors.DarkBlue,
        borderRadius: new BorderRadius.circular(3.0),
      );

  static get BorderRadius3DarkIndigo => new BoxDecoration(
        color: AppColors.AlphaIndigo,
        borderRadius: new BorderRadius.circular(3.0),
      );

  static get BorderRadius3Celeste => new BoxDecoration(
        color: AppColors.AlphaCeleste,
        borderRadius: new BorderRadius.circular(3.0),
      );

  static get BorderRadius30DarkBlue => new BoxDecoration(
        color: AppColors.DarkBlue,
        borderRadius: new BorderRadius.circular(30.0),
      );

  static get BorderRadius7AquaGraident => new BoxDecoration(
      color: AppColors.DarkBlue,
      borderRadius: new BorderRadius.circular(7.0),
      gradient: AppGradient.LinearGradientAquaTopToBottomRight);

  static get BorderRadius30AquaGraident => new BoxDecoration(
      color: AppColors.DarkBlue,
      borderRadius: new BorderRadius.circular(30.0),
      gradient: AppGradient.LinearGradientAqua);

  static get BorderRadius30AzureGraident => new BoxDecoration(
      color: AppColors.DarkBlue,
      borderRadius: new BorderRadius.circular(30.0),
      gradient: AppGradient.LinearGradientAzure);

  static get BorderRadius30AzureGraidentLeftRight => new BoxDecoration(
      borderRadius: new BorderRadius.circular(30.0),
      gradient: AppGradient.LinearGradientAzureLeftRight);

  static get BorderRadius20Green => new BoxDecoration(
      borderRadius: new BorderRadius.circular(20.0), color: Color(0xFF00A551));

  static BorderRadiusAll30ImageBackground(imagePath) => new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: new BorderRadius.all(Radius.circular(30.0)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0),
        ],
      );

  static BorderRadius10ImageBackground(imagePath) => new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: new BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topRight: Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0),
        ],
      );

  static get BorderRadius20ImageBackground => new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(AppImage.EmmWatson), fit: BoxFit.cover),
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0),
        ],
      );

  static get BorderRadius10Green => new BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0), color: Color(0xFF068712));

  static BorderRadius10Color(Color color) => new BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0), color: color);

  static get BorderRadius10Yellow => new BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0), color: Color(0xFFFF9B00));

  static get BorderRadius10Blue => new BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0), color: Color(0xFF11C4CD));

  static get BorderRadius10BottomBlue => new BoxDecoration(
      color: Color(0xFF4B7683),
      borderRadius: new BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)));

  static get BorderRadius10BottomGreen => new BoxDecoration(
      color: Color(0xFF4D8E82),
      borderRadius: new BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)));

  static get BorderRadius10Bottom => new BoxDecoration(
      color: AppColors.YellowLight,
      borderRadius: new BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)));

  static get BorderRadius9BoxShadow3 => BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Colors.black45,
          )
        ],
        color: Colors.orange,
        borderRadius: BorderRadius.circular(9.0),
      );

  static get BorderRadius10 =>
      new BoxDecoration(borderRadius: new BorderRadius.circular(10.0));

  static BorderRadius10ImageRightOnly(imagPath) => new BoxDecoration(
      image: DecorationImage(image: AssetImage(imagPath), fit: BoxFit.cover),
      borderRadius: new BorderRadius.only(
          topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)));

  static BorderRadius10ColorRightOnly(color) => new BoxDecoration(
      color: Color(color),
      borderRadius: new BorderRadius.only(
          topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)));

  static get BorderRadius10YellowYoouma => new BoxDecoration(
      color: Color(0xfffffef2), borderRadius: new BorderRadius.circular(10.0));

  static get BorderRadius10Red => new BoxDecoration(
      borderRadius: new BorderRadius.circular(10.0), color: Color(0xFFFF4500));

  static get BorderRadius60White => new BoxDecoration(
      borderRadius: new BorderRadius.circular(60.0), color: Colors.white);

  static get BorderRadius25White => new BoxDecoration(
      borderRadius: new BorderRadius.circular(25.0), color: Colors.white);

  static get CircleGreen => new BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1DF093),
      );

  static get CircleYellow => new BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF0E889),
      );

  static get CircleYellowLight => new BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFFFFFEF2),
      border: new Border.all(color: Color(0xFF707070).withOpacity(0.3)));

  static get CircleRed => new BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFF0000),
      );

  static get BorderRadius20Red => new BoxDecoration(
      borderRadius: new BorderRadius.circular(20.0), color: Color(0xFFEC1C24));

  static get BorderRadius20Grey => new BoxDecoration(
      borderRadius: new BorderRadius.circular(20.0), color: Color(0xFF808080));

  static get BorderRadius34Grey => new BoxDecoration(
      borderRadius: new BorderRadius.circular(34.0), color: Color(0xFF808080));

  static get BorderRadius34Whites => new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(34.0)),
      color: Colors.white);

  static get BorderRadius35Whites => new BoxDecoration(
      borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(35.0), topRight: new Radius.circular(35.0)),
      color: Colors.white);

  static get BorderRadius5GlassBlue => new BoxDecoration(
        color: AppColors.GlassBlue.withOpacity(0.8),
        borderRadius: new BorderRadius.circular(5.0),
      );

  static get BorderRadius5BorderWhite => new BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: new Border.all(color: Colors.white),
      );

  static get BorderSizeHalf => new BoxDecoration(
      border: new Border(
          top: new BorderSide(color: AppColors.greyColor2, width: 0.5)),
      color: Colors.white);

  static get BorderAll25White => new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(25.0)),
        border: new Border.all(width: 2.0, color: Colors.white),
      );

  static get BorderRadius30DarkWhiteOpacity => new BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: new BorderRadius.circular(30.0),
      );

  static get BorderRadius10WhiteOpacity => new BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: new BorderRadius.circular(10.0),
      );

  static get borderRadiusCircular7Grey => new BoxDecoration(
      borderRadius: BorderRadius.circular(7.0), color: AppColors.StaticGrey);

  static get BorderRadiusCircular7 =>
      new BoxDecoration(borderRadius: BorderRadius.circular(7.0));

  static get BorderRadiusCircular15 =>
      new BoxDecoration(borderRadius: BorderRadius.circular(15.0));

  static get BorderRadiusCircular15Red => new BoxDecoration(
      borderRadius: new BorderRadius.all(Radius.circular(15.0)),
      color: Colors.red);

  static get BorderRadiusCircular15Blue => new BoxDecoration(
      borderRadius: new BorderRadius.all(Radius.circular(15.0)),
      color: Colors.blue);

  static get BorderRadisBoxSadowImage => new BoxDecoration(
      color: Colors.white,
      border: new Border.all(
          color: Colors.green, width: 5.0, style: BorderStyle.solid),
      borderRadius: new BorderRadius.only(
        topLeft: new Radius.elliptical(40.0, 10.0),
        bottomLeft: new Radius.circular(20.0),
      ),
      boxShadow: [
        new BoxShadow(
          color: Colors.red,
          offset: new Offset(20.0, 10.0),
          blurRadius: 20.0,
          spreadRadius: 40.0,
        ),
        new BoxShadow(
            color: Colors.yellow,
            offset: new Offset(20.0, 10.0),
            blurRadius: 20.0,
            spreadRadius: 20.0),
      ],
      shape: BoxShape.circle,
      //Shape for the BoxShadow
      image: new DecorationImage(
        image: new AssetImage(AppImage.login_logo),
        //The image to be painted into the decoration. Typically this will be an AssetImage (for an image shipped with the application) or a NetworkImage (for an image obtained from the network).
      ));

  static get Full => new BoxDecoration(
      color: Colors.white,
      border: AppBorder.BorderAll,
      borderRadius: new BorderRadius.only(
        topLeft: new Radius.elliptical(40.0, 10.0),
        bottomLeft: new Radius.circular(20.0),
      ),
      //You use borderRadius if you want to make the corner of the box rouned,, NB: borderRadius applies only to boxes with rectangular shapes.
      boxShadow: [
        new BoxShadow(
          color: Colors.red,
          offset: new Offset(20.0, 10.0),
          blurRadius: 20.0,
          spreadRadius: 40.0,
        ),
        new BoxShadow(
            color: Colors.yellow,
            offset: new Offset(20.0, 10.0),
            blurRadius: 20.0,
            spreadRadius: 20.0),
      ],
      shape: BoxShape.circle,
      //Shape for the BoxShadow or BoxShape.rectangle
      image: new DecorationImage(
        image: new AssetImage(AppImage.login_logo),
        //The image to be painted into the decoration. Typically this will be an AssetImage (for an image shipped with the application) or a NetworkImage (for an image obtained from the network).

        centerSlice: new Rect.fromLTWH(50.0, 50.0, 220.0, 90.0),
        //Scale Left  50.0, Top 50.0 , Inner Width is 220.0, Inner Hight is 90.0
        colorFilter:
            new ColorFilter.mode(Colors.red.withOpacity(0.5), BlendMode.src),
        repeat: ImageRepeat.noRepeat,
      ));

  static get ImageFoodBackgound => BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppImage.NetworkFoodBackground),
          fit: BoxFit.cover,
        ),
      );

  static get YooumaBackgoundImage => BoxDecoration(
        color: Color(0xff2c2f31),
        image: DecorationImage(
          image: new AssetImage(AppImage.YooumaIntroBackground),
          fit: BoxFit.contain,
        ),
      );

  static get ImageWithDecoration => new BoxDecoration(
      color: Colors.purple,
      gradient: new RadialGradient(
          colors: [
            Colors.red,
            Colors.cyan,
            Colors.purple,
            Colors.lightGreenAccent
          ],
          center: Alignment(0.0, 0.0),
          radius: 0.5,
          tileMode: TileMode.clamp,
          stops: [0.3, 0.5, 0.9, 1.0]),
      image: new DecorationImage(
          image: new NetworkImage("http://jlouage.com/images/author.jpg")));

  static get RoundBorderWhiteTextWtihBlackOpacity => new BoxDecoration(
        borderRadius: new BorderRadius.circular(30.0),
        border: new Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        color: Colors.black.withOpacity(0.3),
      );

  static get ImageDecroationCenterSlice => new DecorationImage(
      image: new AssetImage(AppImage.login_logo),
      centerSlice: new Rect.fromLTWH(50.0, 50.0, 220.0, 90.0),
      fit: BoxFit.fill);

  static get ImageDecorationColorDarken => new BoxDecoration(
      image: new DecorationImage(
          image: new AssetImage(AppImage.sotopia_welcome_background),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), BlendMode.darken)));

  static get ImageDecorationColorFilter => new BoxDecoration(
      image: new DecorationImage(
          image: new AssetImage(AppImage.login_logo),
          colorFilter:
              ColorFilter.mode(Colors.red.withOpacity(0.5), BlendMode.src)));

  // the image is painted above the color and the gradient.
  static get ForegroundDecoartionImage => BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://www.example.com/images/frame.png'),
          centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
        ),
      );

  static get AllBorder => new BoxDecoration(
      border: new Border(
          top: new BorderSide(width: 1.0, color: const Color(0xff999999)),
          right: new BorderSide(width: 1.0, color: const Color(0xff999999)),
          bottom: new BorderSide(width: 1.0, color: const Color(0xff999999)),
          left: new BorderSide(width: 1.0, color: const Color(0xff999999))));

  static get SearchTextInput => InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        hintStyle: AppStyle.hintStyle,
        hintText: 'Search for a player',
        prefixIcon: Icon(
          Icons.person,
          size: 30.0,
          color: Colors.black,
        ),
      );

  static get EmailInput => InputDecoration(
        labelText: 'EMAIL',
        labelStyle: AppStyle.Monsterrat20Grey,
        // hintText: 'EMAIL',
        // hintStyle: ,
      );

  static get InputEmailOutLineBorderPadding => new InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      );
}
