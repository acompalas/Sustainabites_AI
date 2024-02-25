import 'package:budget_bites/appPages/cartPage.dart';
import 'package:budget_bites/appPages/discoverPage.dart';
import 'package:budget_bites/appPages/savedPage.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:flutter/material.dart';
//import 'package:budget_bites/main.dart';

<<<<<<< Updated upstream


class BottomNavBar extends StatefulWidget{
=======
class BottomNavBar extends StatefulWidget {
>>>>>>> Stashed changes
  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  int currentIndex = 0;
  final screens = [
    //homePage(),
    discoverPage(),
    savedPage(),
    cartPage(),
    //accountPage(),
  ];
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
<<<<<<< Updated upstream
        //BottomNavigationBarItem(icon: Icon(Icons.home), label : "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label : "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label : "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label : "Cart"),
        //BottomNavigationBarItem(icon: Icon(Icons.account_circle),label : "Account"),
=======
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "")
>>>>>>> Stashed changes
      ],
      currentIndex: currentIndex,
      onTap: (index) =>setState(()=> currentIndex = index),
    );
  }
}