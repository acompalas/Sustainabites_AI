import 'package:flutter/material.dart';
import 'package:test/SignInUp/signUpEmail.dart';
import 'package:test/SignInUp/signUpName.dart';
import 'package:test/main.dart';
import 'package:test/themes/appColorTheme.dart';
import 'package:test/themes/appTextTheme.dart';
import 'package:test/signInUp/SignInPage.dart';

class signInOutButton extends StatelessWidget { //button style used to for the welcomePage
  final String buttonText; //text to use for button
  signInOutButton({super.key,
    required this.buttonText, //required text to make button
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: screenHeight * .07,
      width: screenWidth * .8,
      child: Center(
        child : Text(
          buttonText,
          style: appTextTheme.signInUpButton,
        )
      ),
      decoration: BoxDecoration(
        color: appColorTheme.buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      ),
      onTap: (){
        if(buttonText == 'Sign In'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const signInPage()),);
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpEmail()),);
        }
      },
      
    );
  }
}

class enterEmailText extends StatelessWidget{
  enterEmailText({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .8,
      height: screenHeight * .1,
      child : TextField(
        decoration: InputDecoration(
          fillColor: appColorTheme.textLabelBackground,
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Enter Email', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
        ),
    )
    );
  }
}

class enterEmailButton extends StatelessWidget{
  enterEmailButton({super.key});
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpName()),);
      },
    );
  }
}

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