import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';

class appTextTheme{
  static TextStyle appTitle = TextStyle( //used for 'Budget Bites' Title in beginning screens
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 2.4,
    fontWeight: FontWeight.w300,
    color: appColorTheme.blackText,
  );
  static TextStyle textUnderTitle = TextStyle( //used for stuff under title
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.8,
    fontWeight: FontWeight.w100,
    color: appColorTheme.blackText,
    height: 1, //height between lines
  );
  static TextStyle textUnderTitleSmaller = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.4,
    fontWeight: FontWeight.w100,
    color: appColorTheme.blackText,
    height: 1,
  );
  static TextStyle signInUpButton = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.85,
    fontWeight: FontWeight.w300,
    color: appColorTheme.buttonTextColor,
  );
  static TextStyle signInUpTextLabel = TextStyle(
    fontFamily:' JosefinSans',
    fontSize: fontMultiplier * 1,
    fontWeight: FontWeight.w100,
    color:appColorTheme.textLabel,
  );
  static TextStyle smallerButtonText = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.5,
    fontWeight: FontWeight.w200,
    color: appColorTheme.buttonTextColor,
  );
}