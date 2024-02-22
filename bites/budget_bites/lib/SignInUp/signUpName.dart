import 'package:budget_bites/SignInUp/signUpCuisine.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

String _firstName = "";
String _lastName = "";

final _firstformKey = GlobalKey<FormState>();
final _lastformKey = GlobalKey<FormState>();

class enterFirstNameText extends StatefulWidget{
  @override
  _enterFirstNameTextState createState()=> _enterFirstNameTextState();
}

class _enterFirstNameTextState extends State<enterFirstNameText> {
  TextEditingController _firstNameController = TextEditingController();
  String? _firstNameErrorText;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _firstformKey,
      child: SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .08,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'First Name',
            hintStyle: appTextTheme.signInUpTextLabel,
            hintMaxLines: 1,
            errorText: _firstNameErrorText,
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              setState(() {
                _firstNameErrorText = "Please enter first name";
              });
              return "Please enter first name";
            }
            setState(() {
              _firstNameErrorText = null; // clear error when passes validation
            });
            return null; // return null when validation passes
          },
          onChanged: (val) {
            _firstName = val;
          },
        ),
      ),
    );
  }
}

class enterLastNameText extends StatefulWidget{
  @override
  _enterLastNameTextState createState()=> _enterLastNameTextState();
}

class _enterLastNameTextState extends State<enterLastNameText>{
  TextEditingController _lastNameController = TextEditingController();
  String? _lastNameErrorText;

  @override
  Widget build(BuildContext context){
    return Form(
      key: _lastformKey,
      child: SizedBox(
        width: screenWidth * .8,
        height: screenHeight * .08,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Last Name',
            hintStyle: appTextTheme.signInUpTextLabel,
            hintMaxLines: 1,
            errorText: _lastNameErrorText,
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              setState(() {
                _lastNameErrorText = "Please enter your last name";
              });
              return "Please enter your last name";
            }
            setState(() {
              _lastNameErrorText = null; // clear error when passes validation
            });
            return null; // return null when validation passes
          },
          onChanged: (val) {
            _lastName = val;
          },
        ),
      ),
    );
  }
}


class enterNameButton extends StatelessWidget {
  enterNameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: screenHeight * .07,
        width: screenWidth * .7,
        child: Center(
            child: Text(
          'Continue',
          style: appTextTheme.signInUpButton,
        )),
        decoration: BoxDecoration(
          color: appColorTheme.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onTap: () {
        if (_firstformKey.currentState!.validate() && _lastformKey.currentState!.validate()) {
          // Validation passed, navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signUpCuisine()),
          );
        }
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