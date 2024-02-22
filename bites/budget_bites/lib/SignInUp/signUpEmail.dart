import 'package:budget_bites/SignInUp/signUpPassword.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

String _email = "";
final _formKey = GlobalKey<FormState>();

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
      key: _formKey,
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
          if (_formKey.currentState!.validate()) {
          // Validation passed, navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => signUpPassword(email: _email,)),
          );
        }
      },
    );
  }
}

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