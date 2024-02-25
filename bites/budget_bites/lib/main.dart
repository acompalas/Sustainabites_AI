//import 'package:budget_bites/archived/recipes.dart';
import 'package:budget_bites/appPages/cartPage.dart';
import 'package:budget_bites/appPages/discoverPage.dart';
import 'package:budget_bites/appPages/savedPage.dart';
import 'package:budget_bites/archived/recipes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/SignInUp/signUpEmail.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/signInUp/SignInPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Variables for Responsive Design(Don't change)
final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
final double screenHeight = physicalHeight / devicePixelRatio;
final double screenWidth = physicalWidth / devicePixelRatio;
final double fontMultiplier = screenHeight * .03;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //sets up the screen size variables
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
        title: 'Budget Bites', //title of the app
        debugShowCheckedModeBanner:
            false, //removes the debug sticker on the right corner of emulator
        home: WelcomePage() //onces the app opens up go to splash page
        ),
  );
}

class SplashPage extends StatelessWidget {
  //splash page
  int duration = 3; //seconds for how long splash page stays
  Widget goToPage = WelcomePage();

  SplashPage({super.key}); //going to openingPage after splash page

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      //process of making the splash page stay for x seconds
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });

    return Scaffold(
      //return splash screen
      //backgroundColor: Color(0x001AC84B),
      body: Container(
        color: appColorTheme.backgroundColor, //setting the background color
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  //opening page
  WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // Text(         //title
                      //   'Budget Bites',
                      //   textAlign: TextAlign.center,
                      //   style: appTextTheme.appTitle,
                      // ),
                      Container(
                        //for text under title
                        alignment: Alignment.center,
                        width: screenWidth * .8,
                        height: screenHeight * .14,
                        padding: EdgeInsets.only(bottom: screenHeight * .01),
                        child: Text(
                          'Let\'s help you clean your pantry',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: appTextTheme.textUnderTitle,
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * 0.01)),
                      Container(
                          //container for logo
                          height: screenHeight * .2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appColorTheme.backgroundColor,
                          ),
                          child: Image.asset(
                            'assets/imgs/logo.png',
                            fit: BoxFit.fitHeight,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: screenHeight *
                                  .125)), //space between logo and button
                      signInOutButton(buttonText: 'Sign In'),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: screenHeight *
                                  .05)), //space between the two buttons
                      signInOutButton(buttonText: 'Sign Up'),
                    ],
                  ))
                ])));
  }
}

class signInOutButton extends StatelessWidget {
  //button style used to for the welcomePage
  final String buttonText; //text to use for button
  signInOutButton({
    super.key,
    required this.buttonText, //required text to make button
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: screenHeight * .07,
        width: screenWidth * .8,
        child: Center(
            child: Text(
          buttonText,
          style: appTextTheme.signInUpButton,
        )),
        decoration: BoxDecoration(
          color: appColorTheme.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onTap: () {
        if (buttonText == 'Sign In') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signInPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signUpEmail()),
          );
        }
      },
    );
  }
}
