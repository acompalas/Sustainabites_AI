import 'package:budget_bites/appPages/cartPage.dart';
import 'package:budget_bites/appPages/discoverPage.dart';
import 'package:budget_bites/appPages/savedPage.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/appPages/homePage.dart';
import 'package:budget_bites/appPages/accountPage.dart';
//import 'package:budget_bites/main.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<mainPage> {
  @override
  int currentIndex = 0;
  final screens = [
    HomePage(),
    //discoverPage(),
    savedPage(),
    cartPage(),
    AccountPage(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        iconSize: screenHeight * .05,
        selectedLabelStyle: appTextTheme.navBarText,
        unselectedLabelStyle: appTextTheme.navBarText,
        selectedItemColor: appColorTheme.navBarSelectedColor,
        unselectedItemColor: appColorTheme.navBarUnSelectedColor,
        backgroundColor: appColorTheme.navBarBackground,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
