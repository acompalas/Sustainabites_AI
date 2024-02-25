import 'package:flutter/material.dart';

class appColorTheme{
  //used just in the welcome pages
  static const Color signInUpGreenText = Color.fromARGB(255, 0, 255, 72); // if you have or dont have account text
  //mainly used in buttons
  static const Color buttonColor = Color(0xFF1AC84B); //color of the background of the button
  static const Color buttonTextColor = Color.fromARGB(255, 255, 255, 255); //color of the text on the button
  //used in all of the app
  static const Color blackText =  Color.fromARGB(255, 0, 0, 0); //used for text
  static const Color backgroundColor = Color(0xFFFCEBEB); //that pinkish background
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  //cuisine filter
  static const Color cuisineUnselected = Color.fromARGB(255, 255, 255, 255);
  static const Color cuisineSelected = Color.fromARGB(255, 0, 0, 0);  
  //navbar stuff
  static const Color navBarBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color navBarSelectedColor = Color.fromARGB(255, 0, 0, 0);
  static const Color navBarUnSelectedColor = Color.fromARGB(238, 84, 86, 85);
  //errors (don't use for anything else)
  static const Color errorRed = Color.fromARGB(255, 225, 9, 9);
  //text label color
  static const Color textLabel = Color.fromARGB(255, 130, 128, 128);
  static const Color textLabelBackground = Color.fromARGB(255, 255, 255, 255);
}