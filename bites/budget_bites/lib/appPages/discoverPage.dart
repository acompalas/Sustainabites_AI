//import 'package:budget_bites/appPages/searchIngredients.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/models/models.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:flutter/material.dart';

class discoverPage extends StatefulWidget {
  @override
  _discoverPage createState() => _discoverPage();
}

class _discoverPage extends State<discoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appColorTheme.backgroundColor,
      body: Container(
        alignment: AlignmentDirectional.topEnd,
        child: Stack(
          alignment:
              AlignmentDirectional.topEnd, //puts components from top to bottom
          children: [
            Center(
              //centering everything on the page
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .02)),
                  discoverSearchBar(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .01)),
                  Text(      
                    'Want to try out a new cuisine?',
                    textAlign: TextAlign.left,
                    style: appTextTheme.myPantryBoxTitle,
                  ),
                  cuisineBar(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .02)),
                  Text(      
                    'Want something specific?',
                    textAlign: TextAlign.left,
                    style: appTextTheme.myPantryBoxTitle,
                  ),
                  mealTypeBar(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .02)),
                  Text(       
                    'Search using your ingredients',
                    textAlign: TextAlign.left,
                    style: appTextTheme.myPantryBoxTitle,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .01)),
                  startAddingIngredients(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class discoverSearchBar extends StatefulWidget {
  @override
  _discoverSearchBar createState() => _discoverSearchBar();
}

class _discoverSearchBar extends State<discoverSearchBar> {
  @override
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SizedBox(
        width: screenWidth * .9,
        height: screenHeight * .06,
        child: TextField(
          //autofocus: true,
          controller: myController,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            print(value);
          },
          //textAlignVertical: TextAlignVertical.center,
          //contentPadding: EdgeInsets.zero,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, size: screenHeight * .04),
            fillColor: appColorTheme.textLabelBackground,
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Search Recipies',
            hintStyle: appTextTheme.searchBar,
            hintMaxLines: 1,
          ),
        ));
  }
}


class startAddingIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double boxWidth = screenWidth * 0.98;
    final double boxHeight = screenHeight * 0.25;

    return Center(
      child: Hero(
        tag: 'pantryImage', // Unique tag for the Hero widget
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IngredientsSelectorPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/pantry.png',
                width: boxWidth,
                height: boxHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class cuisineBar extends StatefulWidget{
  @override
  _cuisineBar createState() => _cuisineBar();
}

class _cuisineBar extends State<cuisineBar>{
  List<cuisine> cuisines = [];
 void _getCuisineList(){
    cuisines = cuisine.getCuisineList();
  }
  Widget build(BuildContext context) {
    _getCuisineList();
    return Container(
        height: screenHeight * .14,
        width: screenWidth * .95,
        child: ListView.separated(
          itemCount: cuisines.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: screenWidth * .05),
          padding: EdgeInsets.only(left: screenWidth * .01, right: screenWidth * .01),
          itemBuilder: (context, index){
            return GestureDetector( 
              onTap: (){},
              child: Container(
                height: screenHeight * .1,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: appColorTheme.buttonColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenWidth * .2,
                      height: screenHeight * .08,
                    ),
                    Text(
                      cuisines[index].cuisineName,
                      style: appTextTheme.cuisineBarText,
                    )
                  ]
                ),
              )
            );
          }
         ),
    );
  }
}




class mealTypeBar extends StatefulWidget{
  @override
  _mealTypeBar createState() => _mealTypeBar();
}

class _mealTypeBar extends State<mealTypeBar>{
  List<mealType> mealTypes = [];
 void _getMealTypeList(){
    mealTypes = mealType.getMealTypeList();
  }
  Widget build(BuildContext context) {
    _getMealTypeList();
    return Container(
        height: screenHeight * .14,
        width: screenWidth * .95,
        child: ListView.separated(
          itemCount: mealTypes.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: screenWidth * .05),
          padding: EdgeInsets.only(left: screenWidth * .01, right: screenWidth * .01),
          itemBuilder: (context, index){
            return GestureDetector( 
              onTap: (){},
              child: Container(
                height: screenHeight * .1,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 255, 0, 0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenWidth * .2,
                      height: screenHeight * .08,
                    ),
                    Text(
                      mealTypes[index].name,
                      style: appTextTheme.cuisineBarText,
                    )
                  ]
                ),
              )
            );
          }
         ),
    );
  }
}