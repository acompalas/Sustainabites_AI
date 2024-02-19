import 'package:budget_bites/SignInUp/signInPantry.dart';
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';

final TextEditingController ingredientSearched = TextEditingController(); //string of what the user searched for
class textPantryEnter extends StatefulWidget{
  @override
  _textPantryEnter createState()=> _textPantryEnter();
}

class _textPantryEnter extends State<textPantryEnter>{
  @override
  void dispose() { 
    // Clean up the controller when the widget is disposed.
    ingredientSearched.dispose();
    super.dispose();
  }
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
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .01)),
                  searchBarIngredients(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .05)),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * .9,
                    height: screenHeight * .6,
                    padding: EdgeInsets.only(bottom: screenHeight * .02),
                    child: hasIngredientSearchResult(),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 0, 0))
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .02)),
                  doneEnteringTextPantryButton(),
                ],
              )
            )
          ]
        )
      )
    );
  }
}


class searchBarIngredients extends StatelessWidget{
  searchBarIngredients({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .95,
      height: screenHeight * .1,
      child : TextField(
        controller: ingredientSearched,
        decoration: InputDecoration(
          fillColor: appColorTheme.textLabelBackground,
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Search Ingredients', 
          hintStyle: appTextTheme.signInUpTextLabel,
          hintMaxLines: 1,
        ),
    )
    );
  }
}


class doneEnteringTextPantryButton extends StatelessWidget{
  doneEnteringTextPantryButton({super.key});
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPantry()));
      },
    );
  }
}

class hasIngredient{
  String ingredientName;
  var ingredientOwned = false;
  hasIngredient(this.ingredientName, this.ingredientOwned);
}

class hasIngredientSearchResult extends StatefulWidget{
  @override
  _hasIngredientSearchResult createState() => _hasIngredientSearchResult();
}

class _hasIngredientSearchResult extends State<hasIngredientSearchResult>{
  List<hasIngredient> OwnIngredientList =[
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
    hasIngredient('ingredient', false),
  ];
  @override
  Widget build(BuildContext context){
    return Scrollbar(
      child: ListView.builder(
      itemCount: OwnIngredientList.length,
      itemBuilder: (context, index){
        bool _valueCheck = OwnIngredientList[index].ingredientOwned;
        return Card(
          child: CheckboxListTile(
            value: _valueCheck,
            onChanged: (value) {
              setState(() {
                OwnIngredientList[index].ingredientOwned= value!;
                //_valueCheck = value!;
              });
              print(OwnIngredientList[index].ingredientOwned);
            },
            title: Text(OwnIngredientList[index].ingredientName),
          )
        );
      }
    ) 
    );
  }
}