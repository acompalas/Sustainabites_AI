import 'package:flutter/material.dart';
import 'package:test/main.dart';
import 'package:test/signInUp/SignInUpComponents.dart';
import 'package:test/themes/appColorTheme.dart';
import 'package:test/themes/appTextTheme.dart';
class signUpEmail extends StatefulWidget{
  @override
  _signUpEmail createState()=> _signUpEmail();
}

class _signUpEmail extends State<signUpEmail> {
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
                  Container(
                    width: screenWidth * .8,
                    height: screenHeight * .085,
                    child: Text(         //title
                      'Budget Bites',
                      textAlign: TextAlign.center,
                      style: appTextTheme.appTitle,
                    ),
                  ),
                  // Text(         //title
                  //   'Budget Bites',
                  //   textAlign: TextAlign.center,
                  //   style: appTextTheme.appTitle,
                  // ),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .8,
                    height: screenHeight * .14,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Let\'s get you started',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitle,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.01)),
                  enterEmailText(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .45)),
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