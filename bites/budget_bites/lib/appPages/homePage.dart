import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:budget_bites/themes/appBoxTheme.dart';
import 'package:budget_bites/shared/navigationBar.dart'; // Import the file containing BottomNavBar
import 'package:flutter/material.dart';
import 'package:budget_bites/main.dart';
import 'package:budget_bites/appPages/ingredients.dart';

class MyPantry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired width and height of the SizeBox
    final double boxWidth = screenWidth * 0.98; // 98% of screen width
    final double boxHeight = screenHeight * 0.25; // 25% of screen height

    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle button press action
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IngredientsPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4, // Add elevation for shadow effect
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(20), // Clip image to rounded corners
            child: Image.asset(
              'assets/imgs/pantry.png',
              width: boxWidth, // Set image width to match button width
              height: boxHeight, // Set image height to match button height
              fit: BoxFit.cover, // Scale and crop the image to fill the button
            ),
          ),
        ),
      ),
    );
  }
}

class MyEquipment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired width and height of the SizeBox
    final double boxWidth = screenWidth * 0.98; // 98% of screen width
    final double boxHeight = screenHeight * 0.25; // 25% of screen height

    return Center(
      child: SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: const Text('Hi mom'),
        ),
      ),
    );
  }
}

class MyNutrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired width and height of the SizeBox
    final double boxWidth = screenWidth * 0.98; // 98% of screen width
    final double boxHeight = screenHeight * 0.25; // 25% of screen height

    return Center(
      child: SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: const Text('Hi mom'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Homepage',
          style: appTextTheme.homePageTitle, // Use the homePageTitle style here
        ),
        automaticallyImplyLeading: false, // Disable the back arrow
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome to BudgetBites!',
                style: appTextTheme.myPantryBoxTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Pantry',
                style: appTextTheme.myPantryBoxTitle,
              ),
            ),
            MyPantry(), // Display MyPantry widget below the title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Equipment',
                style: appTextTheme.myPantryBoxTitle,
              ),
            ),
            MyEquipment(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Nutrition',
                style: appTextTheme.myPantryBoxTitle,
              ),
            ),
            MyNutrition(),
            // Add additional widgets below MyPantry as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Use BottomNavBar here
    );
  }
}
