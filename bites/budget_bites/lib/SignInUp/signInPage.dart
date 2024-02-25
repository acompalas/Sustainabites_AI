import 'package:budget_bites/appPages/cartPage.dart';
import 'package:budget_bites/appPages/discoverPage.dart';
import 'package:budget_bites/appPages/mainPage.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:budget_bites/appPages/homePage.dart';
import 'package:budget_bites/appPages/accountPage.dart';
//bites\budget_bites\lib\appPages\accountPage.dart
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

class signInPage extends StatefulWidget {
  @override
  _signInPage createState() => _signInPage();
}

class _signInPage extends State<signInPage> {
  //const signInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //so it doesnt cause error when having keyboard
        body: Container(
            color: appColorTheme.backgroundColor,
            child: Stack(
                alignment: AlignmentDirectional
                    .topEnd, //puts components from top to bottom
                children: [
                  Center(
                      //centering everything on the page
                      child: Column(
                    //so things dont overlap
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * .8,
                        height: screenHeight * .085,
                        child: Text(
                          //title
                          'Budget Bites',
                          textAlign: TextAlign.center,
                          style: appTextTheme.appTitle,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * .01)),
                      Container(
                        //for text under title
                        alignment: Alignment.center,
                        width: screenWidth * .8,
                        height: screenHeight * .055,
                        padding: EdgeInsets.only(bottom: screenHeight * .01),
                        child: Text(
                          'Welcome Back',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: appTextTheme.textUnderTitle,
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * .025)),
                      enterUsernameText(),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * .025)),
                      enterPasswordText(),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * .07),
                      ),
                      signInButton(),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: screenHeight * .3,
                        ),
                      ),
                    ],
                  ))
                ])));
  }
}

class enterUsernameText extends StatelessWidget {
  enterUsernameText({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .08,
        child: TextField(
          decoration: InputDecoration(
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Username',
            hintStyle: appTextTheme.signInUpTextLabel,
            hintMaxLines: 1,
          ),
        ));
  }
}

class enterPasswordText extends StatelessWidget {
  enterPasswordText({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .08,
        child: TextField(
          obscureText: true,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Password',
            hintStyle: appTextTheme.signInUpTextLabel,
            hintMaxLines: 1,
          ),
        ));
  }
}

class signInButton extends StatelessWidget {
  signInButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: screenHeight * .07,
        width: screenWidth * .7,
        child: Center(
            child: Text(
          'Sign In',
          style: appTextTheme.signInUpButton,
        )),
        decoration: BoxDecoration(
          color: appColorTheme.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mainPage()),
        );
      },
    );
  }
}
