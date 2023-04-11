

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hipal/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    cardTheme: CardTheme(
      elevation: 0.0,
      margin: EdgeInsets.symmetric( vertical: 5.0, horizontal: 10.0 ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(26),
      ),
      color: Color(0xffffffff)
    ),
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        insets: EdgeInsets.only( left: 40.0, right: 40 ),
        borderSide: BorderSide(
          width: 3.0,
          color: kTabBarTheme,
        )
      )
    ),
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: kAppBar,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo,
      elevation: 0
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: kTextColor),
      caption: TextStyle(color: kTextColor),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 3.0,
      textStyle: TextStyle(color: kTextColor, fontSize: 14.0)
    ),
  );
}