import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:flutter/material.dart';

class savedPage extends StatefulWidget{
  @override
  _savedPage createState()=> _savedPage();
}

class _savedPage extends State<savedPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColorTheme.backgroundColor,
      body: Container(
        alignment: AlignmentDirectional.topEnd,
        child: Stack(
          alignment: AlignmentDirectional.topEnd, //puts components from top to bottom
          children: [
            Center( //centering everything on the page
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('saved page'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}