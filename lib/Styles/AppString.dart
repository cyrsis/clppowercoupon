import 'dart:ui';

import 'package:flutter/material.dart';

class AppString {
  static String desc =
      "Get maximum support, comfort and a refreshed look with these adidas energy cloud shoes for men comes wit a classic style."
      "Boost your running comfort to the next level with this supportive shoe Synthetic upper with FITFRAME midfoot cage for a locked-down fit and feel"
      "Lace-up closure Cushioned footbed CLOUDFOAM midsole provides responsive padding Durable ADIWEAR™ rubber sole.";

  static String SampleCode = """
    new Padding(
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
    """;
  static List<Color> ListOfcolorsForOption = [
    Color(0xFFF9362E),
    Color(0xFF003CFF),
    Color(0xFFFFB73A),
    Color(0xFF3AFFFF),
    Color(0xFF1AD12C),
    Color(0xFFD66400),
  ];
  //Number List
  static List<String> sizeNumlist = [
    "7",
    "8",
    "9",
    "10",
  ];
  ////-------- Currency -------
  static const String usd = 'USD';
  static const String sgd = 'SGD';
  ////-------- Validation -------
  //static const String _kMin8CharsOneLetterOneNumber = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
//static const String _kMin8CharsOneLetterOneNumberOnSpecialCharacter = r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
//const String _kMin8CharsOneUpperLetterOneLowerLetterOnNumber = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
  static const String _kMin8CharsOneUpperOneLowerOneNumberOneSpecial =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
//static const String _kMin8Max10OneUpperOneLowerOneNumberOneSpecial = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$";
  final String HOME_SCREEN = "/HOME_SCREEN";
  final String CAMERA_SCREEN = "/CAMERA_SCREEN";

  //Goal list Message String in
  static const String goalValidateMessage =
      "Your goal should have min of 10 characters";
  static const String nameValidateMessage = "Only alphabets are allowed";
  static const String emailField = "email";
  static const String goalField = "goals";
  static const String collectionName = "users";
  static const String emailValidateMessage = "Enter a valid email";
  static const String passwordValidateMessage =
      "Password must be at least 4 characters";
  static const String passwordHint = "Enter Password";
  static const String emailHint = "Enter Email ID";
  static const String submit = "Submit";
  static const String errorMessage = "Please fix all the errors";
  static const String goalListTitle = "Goals List";
  static const String worldTab = "World";
  static const String myTab = "Me";

  //routes
  static const String homeRoute = "/home";
  static const String profileOneRoute = "/View Profile";
  static const String profileTwoRoute = "/Profile 2";
  static const String notFoundRoute = "/No Search Result";
  static const String timelineOneRoute = "/Feed";
  static const String timelineTwoRoute = "/Tweets";
  static const String settingsOneRoute = "/Device Settings";
  static const String shoppingOneRoute = "/Shopping List";
  static const String shoppingTwoRoute = "/Shopping Details";
  static const String shoppingThreeRoute = "/Product Details";
  static const String paymentOneRoute = "/Credit Card";
  static const String paymentTwoRoute = "/Payment Success";
  static const String loginOneRoute = "/Login With OTP";
  static const String loginTwoRoute = "/Login 2";
  static const String dashboardOneRoute = "/Dashboard 1";
  static const String dashboardTwoRoute = "/Dashboard 2";

  //strings
  static const String appName = "FluttersandBox2018";

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  static const String pkImage = "$imageDir/pk.jpg";
  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";

  //login
  static const String enter_code_label = "Phone Number";
  static const String enter_code_hint = "10 Digit Phone Number";
  static const String enter_otp_label = "OTP";
  static const String enter_otp_hint = "4 Digit OTP";
  static const String get_otp = "Get OTP";
  static const String resend_otp = "Resend OTP";
  static const String login = "Login";
  static const String enter_valid_number = "Enter 10 digit phone number";
  static const String enter_valid_otp = "Enter 4 digit otp";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String forgot_password = "Forgot Password?";
  static const String something_went_wrong = "Something went wrong";
  static const String coming_soon = "Coming Soon";

  static const MaterialColor ui_kit_color = Colors.grey;

//colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
  static List<Color> kitGradients2 = [
    Colors.cyan.shade600,
    Colors.blue.shade900
  ];

  static String OrLoginWith = 'Or Login with';

  static String CafeID = "cafeID";
  static String UID = "uid";

  static get CatGram => "Cat's Gram";

  static String get YoouMaAppBarTitle => "Y O O U M A";

  static get ArroCafePhoto => "arrorcafephoto";
}
