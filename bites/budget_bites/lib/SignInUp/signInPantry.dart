import 'package:budget_bites/SignInUp/textPantryEnter.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
//import 'package:budget_bites/SignInUp/signUpEquipment.dart';

class signUpPantry extends StatefulWidget{
  @override
  _signUpPantry createState()=> _signUpPantry();
}

class _signUpPantry extends State<signUpPantry>{
  @override
  Widget build(BuildContext context){
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
                    height: screenHeight * .11,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Let\'s see what you have in your pantry!',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.01)),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .8,
                    height: screenHeight * .055,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Enter with:',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  addIngredientsButton(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .01)),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .8,
                    height: screenHeight * .055,
                    padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Current Pantry List',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * .9,
                    height: screenHeight * .4,
                    child:pantryList(),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 0, 0))
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .1)),
                  doneButton(),
                ],
              )
            )
          ]
        )
      )
    );
  }
}



class addIngredientsButton extends StatelessWidget{
  addIngredientsButton({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
        height: screenHeight * .07,
      width: screenWidth * .3,
      child: Center(
        child : Text(
          'Text',
          style: appTextTheme.smallerButtonText,
        )
      ),
      decoration: BoxDecoration(
        color: appColorTheme.buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      ),
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => textPantryEnter()),);
      },
    );
  }
}


class pantryList extends StatefulWidget{
  @override
  _pantryList createState() => _pantryList();
}

class _pantryList extends State<pantryList>{
  List<String> pantryList =[
    'Food1',
  ];
  @override
  Widget build(BuildContext context){
    return Scrollbar(
      child: ListView.builder(
      itemCount: pantryList.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){
              print(pantryList[index]);
            },
            title: Text(pantryList[index]),
          )
        );
      }
    ) 
    );
  }
}


class doneButton extends StatelessWidget{
  doneButton({super.key});
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Container(
        height: screenHeight * .07,
      width: screenWidth * .7,
      child: Center(
        child : Text(
          'Done',
          style: appTextTheme.signInUpButton,
        )
      ),
      decoration: BoxDecoration(
        color: appColorTheme.buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      ),
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPantry()),);
      },
    );
  }
}