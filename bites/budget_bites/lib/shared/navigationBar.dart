import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:flutter/material.dart';
//import 'package:budget_bites/main.dart';

class BottomNavBar extends StatefulWidget{
  @override
  _BottomNavBar createState()=> _BottomNavBar();
}
class _BottomNavBar extends State<BottomNavBar>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      iconSize: screenHeight * .05,
      selectedLabelStyle: appTextTheme.navBarText,
      unselectedLabelStyle: appTextTheme.navBarText,
      selectedItemColor: appColorTheme.navBarSelectedColor,
      unselectedItemColor: appColorTheme.navBarUnSelectedColor,
      backgroundColor: appColorTheme.navBarBackground,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label : "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label : "Discover"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label : "Saved"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label : "Cart"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label : "Account"
        )
      ],
    );
  }
}