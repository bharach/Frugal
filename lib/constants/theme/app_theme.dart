// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppTheme {
  //Light Theme Colors
  static Color lightBackgroundColor = const Color(0xffFFFFFF);
  static Color lightPrimaryColor = const Color(0xffF5E8EA);
  static Color lightSecondaryColor = const Color(0xff192533);
  static Color iconColor = const Color(0xffEEF0EB);

  ///Light Theme configuration
  static final lightTheme = ThemeData(
    textTheme: lightTextTheme,
    brightness: Brightness.light,
    backgroundColor: lightBackgroundColor,
    primaryColorLight: lightPrimaryColor,
    // accentColor: lightSecondaryColor,
    // selectedRowColor: tertiaryColor,
    // unselectedWidgetColor: iconColor,
    // toggleButtonsTheme:
    //     ToggleButtonsThemeData(color: tertiaryColor, disabledColor: iconColor),
    // //buttonTheme: ButtonThemeData(buttonColor: tertiaryColor),
    // toggleableActiveColor: tertiaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  ///Light TextTheme configuration
  static const TextTheme lightTextTheme =  TextTheme(
    headline4: _mainTitle,
    headline5: _title,
    subtitle1: _subtitle,
    bodyText1: _body,
    bodyText2: _detail,
  );
  /// Main Title
  static const TextStyle _mainTitle = TextStyle(
    fontFamily: "RedHatDisplay-Black",
    fontSize: 36,
  );

  /// Title
  static const TextStyle _title = TextStyle(
    fontFamily: "RedHatDisplay-Bold",
    fontSize: 28,
  );

  /// Subtitle
  static const TextStyle _subtitle =  TextStyle(
    fontFamily: "RedHatDisplay-Medium",
    fontSize: 18,
  );

  /// Body
  static const TextStyle _body =  TextStyle(
    fontFamily: "RedHatDisplay-Regular",
    fontSize: 16,
  );

  /// Detail
  static const TextStyle _detail =  TextStyle(
    fontFamily: "RedHatDisplay-Regular",
    fontSize: 14,
  );
}