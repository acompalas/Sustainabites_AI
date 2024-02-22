import 'package:budget_bites/SignInUp/signUpName.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

final _formKeyPass1 = GlobalKey<FormState>();
final _formKeyPass2 = GlobalKey<FormState>();

String _pass1 = "";
String _pass2 = "";

class signUpPassword extends StatefulWidget{

  final String email;
  signUpPassword({required this.email});

  @override
  _signUpPassword createState()=> _signUpPassword();
}

class _signUpPassword extends State<signUpPassword> {
  late String _email;
  @override
  void initState() {
    super.initState();
    _email = widget.email;
  }

  // auth
  void createacc(String pass) {
    print('Email: $_email, Password: $pass');
  }

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
                        'Great Email',
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
                  enterPasswordButton(
                    email: _email,
                    createacc: createacc, // Pass the function to the button
                  ),
                ],
              )
            )
          ]
        )
      )
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
      key: _formKeyPass1,
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
          _pass1 = val;
        },
      )
      ),
    );
  }
}

class enterPasswordAgainText extends StatefulWidget{
  @override
  _enterPasswordAgainText createState()=> _enterPasswordAgainText();
}

class _enterPasswordAgainText extends State<enterPasswordAgainText>{
  String? _pass2Error;

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKeyPass2,
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
          hintText: 'Re-Password', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
          errorText: _pass2Error,
        ),
        validator: (val) {
            if (val == null || val.isEmpty) {
              setState(() {
                _pass2Error = "Please re-enter your password";
              });
              return "Please re-enter your password";
            } else if (val != _pass1) {
              setState(() {
                _pass2Error = "Passwords do not match";
              });
              return "Passwords do not match";
            }
            setState(() {
              _pass2Error = null; // clear error when passes validation
            });
            return null; // return null when validation passes
          },
          onChanged: (val) {
            _pass2 = val;
          },
      )
      ),
    );
  }
}


class enterPasswordButton extends StatelessWidget{

  final String email;
  final Function createacc; // Receive the function

  enterPasswordButton({
    required this.email,
    required this.createacc,
  });

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
          if (_formKeyPass1.currentState!.validate() && _formKeyPass2.currentState!.validate()) {
          // Validation passed, navigate to the next screen
          createacc(_pass2);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signUpName()),
          );
        }
      },
    );
  }
}