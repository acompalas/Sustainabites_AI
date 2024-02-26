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
import 'package:budget_bites/services/auth.dart';

String _email = "";
String _pass = "";

final _formKeyEmail = GlobalKey<FormState>();
final _formKeyPass = GlobalKey<FormState>();

class signInPage extends StatefulWidget {
  @override
  _signInPage createState() => _signInPage();
}

class _signInPage extends State<signInPage> {
  //const signInPage({super.key});

  Future<bool> signIntoAccount(String email, String pass) async {
  final AuthService _auth = AuthService();

  dynamic result = await _auth.signIn(email, pass);

  if (result == false) {
    return false;
  } else {
    return true;
  }
}

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
                      enterEmailText(),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: screenHeight * .025)),
                      enterPasswordText(),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * .07),
                      ),
                      signInButton(signIntoAccount: signIntoAccount,),
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

class enterEmailText extends StatefulWidget{
  @override
  _enterEmailTextState createState()=> _enterEmailTextState();
}

class _enterEmailTextState extends State<enterEmailText>{
  TextEditingController _emailController = TextEditingController();
  String? _emailError;

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKeyEmail,
      child: SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .1,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Email',
            hintStyle: appTextTheme.signInUpTextLabel,
            hintMaxLines: 1,
            errorText: _emailError,
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Email is required';
            } else if (!isEmailValid(val)) {
              return 'Enter a valid email address';
            }
            return null; // Return null when validation passes
          },
          onChanged: (val) {
            setState(() {
              // Clear error text when the input changes
              _emailError = null;
            });
            _email = val;
          },
        ),
      ),
    );
  }
}

class enterPasswordText extends StatefulWidget{
  @override
  _enterPasswordText createState()=> _enterPasswordText();
}

class _enterPasswordText extends State<enterPasswordText>{

  String? _pass1Error;
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKeyPass,
      child: SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .08,
        child : TextFormField(
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
          errorText: _pass1Error,
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            setState(() {
              _pass1Error = "Please enter a password";
            });
            return "Please enter a password";
          }
          setState(() {
            _pass1Error = null; // clear error when passes validation
          });
          return null; // return null when validation passes
        },
        onChanged: (val) {
          _pass = val;
        },
      )
      ),
    );
  }
}

class signInButton extends StatelessWidget {

  final Function signIntoAccount; // Receive the function

  signInButton({
    required this.signIntoAccount,
  });

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
      onTap: () async {
        if (_formKeyEmail.currentState!.validate() && _formKeyPass.currentState!.validate()) {
          bool signInSuccess = await signIntoAccount(_email, _pass);
          if (!signInSuccess) {
            // Sign-in failed, show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Account does not exist or incorrect password.'),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            // Sign-in successful, navigate to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mainPage()),
            );
          }
        }
      },
    );
  }
}
