import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';

class appTextTheme {
  static TextStyle appTitle = TextStyle(
    //used for 'Budget Bites' Title in beginning screens
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 2.4,
    fontWeight: FontWeight.w300,
    color: appColorTheme.blackText,
  );
  static TextStyle textUnderTitle = TextStyle(
    //used for stuff under title
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
    fontFamily: ' JosefinSans',
    fontSize: fontMultiplier * 1,
    fontWeight: FontWeight.w100,
    color: appColorTheme.textLabel,
  );
  static TextStyle smallerButtonText = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.5,
    fontWeight: FontWeight.w200,
    color: appColorTheme.buttonTextColor,
  );
  static TextStyle navBarText = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * .7,
    fontWeight: FontWeight.w300,
    //color: appColorTheme.buttonTextColor,
  );
  static TextStyle searchBar = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.1,
    fontWeight: FontWeight.w200,
  );
  static TextStyle cuisineBarText = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * .7,
    fontWeight: FontWeight.w200,
  );
  static TextStyle myPantryBoxTitle = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.1,
    fontWeight: FontWeight.w400,
    color: appColorTheme.blackText,
  );
  static TextStyle homePageTitle = TextStyle(
    // Used for the title text in HomePage
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 2, // Adjust font size as needed
    fontWeight: FontWeight.w400,
    color: appColorTheme.blackText,
  );
  static TextStyle accountPageTitle = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 2,
    fontWeight: FontWeight.w400,
    color: appColorTheme.blackText,
    height: 1,
  );
  static TextStyle serachIngredientTitle = TextStyle(
    fontFamily: 'JosefinSans',
    fontSize: fontMultiplier * 1.4,
    fontWeight: FontWeight.w300,
    color: appColorTheme.blackText,
  );
}
