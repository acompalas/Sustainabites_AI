import 'package:budget_bites/main.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/shared/navigationBar.dart';
import 'package:flutter/material.dart';

class discoverPage extends StatefulWidget{
  @override
  _discoverPage createState()=> _discoverPage();
}

class _discoverPage extends State<discoverPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
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
                  discoverSearchBar(),
                  Padding(padding: EdgeInsets.only(bottom: screenHeight * .02)),
                  cuisineBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}








class discoverSearchBar extends StatefulWidget{
  @override
  _discoverSearchBar createState()=> _discoverSearchBar();
}

class _discoverSearchBar extends State<discoverSearchBar>{
  @override
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return SizedBox(
      width: screenWidth * .9,
      height: screenHeight * .06,
      child : TextField(
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
          hintText: 'I forgot what this is for', 
          hintStyle: appTextTheme.searchBar,
          hintMaxLines: 1,
        ),
    )
    );
  }
}

class cuisineBar extends StatefulWidget{
  @override
  _cuisineBar createState()=> _cuisineBar();
}
class _cuisineBar extends State<cuisineBar>{
  final List<String> cuisineList = <String>['Cuisine 1', 'Cuisine2', 'Cuisine 3', 'Cuisine 4', 'Cuisine 5', 'Cuisine 6', 'Cuisine 7', 'Cuisine 8'];
  @override
  Widget build(BuildContext context){
    return Container(
      height: screenHeight * .03,
      width: screenWidth * .95,
      child : ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: screenWidth * .01);
        },
        scrollDirection: Axis.horizontal,
        //padding: EdgeInsets.only(left: screenWidth * .1),
        itemCount: cuisineList.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            child : Container(
              padding: EdgeInsets.only(left: screenWidth * .01, right: screenWidth * .01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: appColorTheme.signInUpGreenText,
              ),
              child: Center(
                child: Text( 
                  '${cuisineList[index]}',
                  style: appTextTheme.cuisineBarText,
                  textAlign: TextAlign.center,
                ),
              ), 
            ),   
            onTap: (){} ,     
          );
        }
      )
    );
  }
}
