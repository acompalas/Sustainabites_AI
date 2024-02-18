import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/SignInUp/signUpEquipment.dart';

class signUpCuisine extends StatefulWidget{
  @override
  _signUpCuisine createState()=> _signUpCuisine();
}

class _signUpCuisine extends State<signUpCuisine> {
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
                  Padding(padding: EdgeInsets.only(top : screenHeight * 0.05)),
                  Container( //for text under title
                    alignment: Alignment.center,
                    width: screenWidth* .9,
                    height: screenHeight * .1,
                    //padding: EdgeInsets.only(bottom: screenHeight * .01),
                    child : Text(
                        'Select cusines that you prefer, First Name.',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: appTextTheme.textUnderTitleSmaller,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom : screenHeight * 0.02)),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * .9,
                    height: screenHeight * .7,
                    padding: EdgeInsets.only(bottom: screenHeight * .02),
                    child: cuisineList(),
                  ),
                  enterCuisineButton(),
                  
                ],
              )
            )
          ]
        )
      )
    );
  }
}



class enterCuisineButton extends StatelessWidget{
  enterCuisineButton({super.key});
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpEquipment()),);
      },
    );
  }
}



class cuisinePrefered{
  String cuisineName;
  var preferedCuisine = false;
  cuisinePrefered(this.cuisineName, this.preferedCuisine);
}

class cuisineList extends StatefulWidget{
  @override
  _cuisineList createState() => _cuisineList();
}

class _cuisineList extends State<cuisineList>{
  List<cuisinePrefered> cuisineList =[
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
    cuisinePrefered('hi', false),
  ];
  @override
  Widget build(BuildContext context){
    return Scrollbar(
      child: ListView.builder(
      itemCount: cuisineList.length,
      itemBuilder: (context, index){
        bool _valueCheck = cuisineList[index].preferedCuisine;
        return Card(
          child: CheckboxListTile(
            value: _valueCheck,
            onChanged: (value) {
              setState(() {
                cuisineList[index].preferedCuisine = value!;
                //_valueCheck = value!;
              });
              print(cuisineList[index].preferedCuisine);
            },
            title: Text(cuisineList[index].cuisineName)
          )
        );
      }
    ) 
    );
  }
}