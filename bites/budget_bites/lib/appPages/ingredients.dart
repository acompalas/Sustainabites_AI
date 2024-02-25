import 'package:flutter/material.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Page extends StatelessWidget {
  final Key? key; // Nullable key parameter

  const Page({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0), // Rounded corners for each page
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.shade300,
      //     ),
      //     BoxShadow(
      //       color: Colors.white,
      //       spreadRadius: -5.0,
      //       blurRadius: 12.0,
      //     ),
      //   ],
      // ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0), // Add padding to the top
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // Disable scrolling
            padding: EdgeInsets.zero, // No padding
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 circles per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 12, // Total circles
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black), // Black border
                ),
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.white, // Empty circle
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class IngredientBox extends StatefulWidget {
  final Function(int) onIndexChanged; // Callback function to notify index change

  IngredientBox({required this.onIndexChanged});

  @override
  _IngredientBoxState createState() => _IngredientBoxState();
}

class _IngredientBoxState extends State<IngredientBox> {
  static const int defaultPages = 3; // Default number of pages
  int _currentIndex = 0;
  int _numPages = defaultPages;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.75,
        aspectRatio: screenWidth / screenHeight,
        viewportFraction: 1,
        initialPage: _currentIndex,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
            print('Current Index: $_currentIndex'); // Print current index for debugging
          });
          // Call the callback to notify the index change
          widget.onIndexChanged(index);
        },
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
      items: List.generate(_numPages, (index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Page(
                // child: Center(
                //   child: Text(
                //     'Page ${index + 1}',
                //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ),
            );
          },
        );
      }),
    );
  }
}
class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  DotIndicator({
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}


class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  int _currentIndex = 0;
  int _numPages = 3; // Initially set to 3, but can be updated as users add pages

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 10.0,
              bottom: 100.0, // Adjust the bottom padding here
            ),
            child: IngredientBox(
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Column(
            children: [
              DotIndicator(
                currentIndex: _currentIndex,
                itemCount: _numPages, // Pass the dynamic itemCount here
              ),
              SizedBox(height: 16.0),
              FloatingActionButton(
                onPressed: () {}, // Add your functionality here
                backgroundColor: Color(0xFFd9ead3), // Light green color
                child: Icon(
                  Icons.add,
                  color: Color(0xFF101f08), // Dark green color
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IngredientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'pantryImage', // Same tag as the one used in MyPantry
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    'assets/imgs/pantry2.png',
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0, // Position app bar at the top
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent, // Make app bar transparent
              elevation: 0, // Remove app bar shadow
              automaticallyImplyLeading: true, // Show the back arrow
              iconTheme: IconThemeData(color: Colors.black87), // Change the color of the back arrow
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Inventory(),
          ),
        ],
      ),
    );
  }
}