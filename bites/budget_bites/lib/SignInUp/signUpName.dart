import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'package:test/signInUp/SignInUpComponents.dart';
import 'package:test/themes/appColorTheme.dart';
import 'package:test/themes/appTextTheme.dart';
class signUpName extends StatefulWidget{
  @override
  _signUpName createState()=> _signUpName();
}

class _signUpName extends State<signUpName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false, //so it doesnt cause error when having keyboard
      body: Container(
        color: appColorTheme.backgroundColor,
        child : Stack(
          alignment: AlignmentDirectional.topEnd, //puts components from top to bottom
          children: [
            Center( //centering everything on the page
              child: Column( //so things dont overlap
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .8,
                    height: screenHeight * .14,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Hello there, what is your name?',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitle,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.01)),
                  enterFirstNameText(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .025)),
                  enterLastNameText(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .4)),
                  enterEmailButton(),
                ],
              )
            )
          ]
        )
      )
    );
  }
}