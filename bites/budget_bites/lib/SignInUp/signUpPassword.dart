import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/SignInUp/signUpCuisine.dart';
class signUpPassword extends StatefulWidget{
  @override
  _signUpPassword createState()=> _signUpPassword();
}

class _signUpPassword extends State<signUpPassword> {
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
                    width: screenWidth* .9,
                    height: screenHeight * .055,
                    padding: EdgeInsets.only(bottom: screenHeight * 0),
                    child : Text(
                        'Hello, First Name!',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .85,
                    height: screenHeight * .055,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Let\'s make a password.',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.01)),
                  enterPasswordText(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .025)),
                  enterPasswordAgainText(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .3)),
                  enterPasswordButton(),
                ],
              )
            )
          ]
        )
      )
    );
  }
}

class enterPasswordText extends StatelessWidget{
  enterPasswordText({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .8,
      height: screenHeight * .08,
      child : TextField(
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
    )
    );
  }
}

class enterPasswordAgainText extends StatelessWidget{
  enterPasswordAgainText({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .8,
      height: screenHeight * .08,
      child : TextField(
        obscureText: true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: appColorTheme.textLabelBackground,
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Re-enter Password', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
        ),
    )
    );
  }
}


class enterPasswordButton extends StatelessWidget{
  enterPasswordButton({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
        height: screenHeight * .07,
      width: screenWidth * .7,
      child: Center(
        child : Text(
          'Continue',
          style: appTextTheme.signInUpButton,
        )
      ),
      decoration: BoxDecoration(
        color: appColorTheme.buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      ),
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpCuisine()),);
      },
    );
  }
}