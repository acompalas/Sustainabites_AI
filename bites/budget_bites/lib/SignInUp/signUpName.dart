import 'package:budget_bites/SignInUp/signUpPassword.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

class enterFirstNameText extends StatelessWidget{
  enterFirstNameText({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .8,
      height: screenHeight * .08,
      child : TextField(
        decoration: InputDecoration(
          fillColor: appColorTheme.textLabelBackground,
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'First Name', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
        ),
    )
    );
  }
}

class enterLastNameText extends StatelessWidget{
  enterLastNameText({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .8,
      height: screenHeight * .08,
      child : TextField(
        decoration: InputDecoration(
          fillColor: appColorTheme.textLabelBackground,
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Last Name', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
        ),
    )
    );
  }
}


class enterNameButton extends StatelessWidget{
  enterNameButton({super.key});
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPassword()),);
      },
    );
  }
}
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
                  enterNameButton(),
                ],
              )
            )
          ]
        )
      )
    );
  }
}