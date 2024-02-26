import 'package:flutter/material.dart';
import 'package:budget_bites/themes/appTextTheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:budget_bites/themes/appColorTheme.dart';
import 'package:provider/provider.dart';
import 'package:budget_bites/appPages/inventory_state.dart';

const int maxSlotsPerPage = 12;

class IngredientPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine the size of the square box
    double boxWidth = screenWidth * 1.0;
    double boxHeight = screenHeight * 0.4;
    double circleSize = screenWidth * 0.45;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
          width: boxWidth,
          height: boxHeight,
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 15.0),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: circleSize,
                height: circleSize,
                alignment: Alignment.topCenter,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black), // Black border
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: circleSize * 1.5, // Adjust the width here
                child: TextField(
                  textAlign: TextAlign.center, // Center align the text
                  decoration: InputDecoration(
                    hintText: 'Empty',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 3.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to add ingredient
                },
                child: Text('Add'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(150, 50)), // Adjust the button size here
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientSlot extends StatefulWidget {
  final int index;
  final List<InventoryItem> items;
  final void Function(int) onSlotPressed;

  IngredientSlot({
    required this.index,
    required this.items,
    required this.onSlotPressed,
    Key? key,
  }) : super(key: key);

  @override
  _IngredientSlotState createState() => _IngredientSlotState();
}

class _IngredientSlotState extends State<IngredientSlot> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the provided callback when the slot is pressed
        widget.onSlotPressed(widget.index);
      },
      child: CircleAvatar(
        radius: 16.0,
        backgroundColor: Colors.white,
        child: Text(
          '${widget.index + 1}', // Display the index number inside the circle
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int pageIndex;
  final List<InventoryItem> items;

  const Page({
    required this.pageIndex,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: maxSlotsPerPage,
            itemBuilder: (BuildContext context, int index) {
              int actualIndex = pageIndex * maxSlotsPerPage + index;
              items[actualIndex].index = actualIndex;
              return IngredientSlot(
                index: actualIndex,
                items: items,
                onSlotPressed: (index) {
                  // Show the ingredient popup when a slot is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return IngredientPopup();
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class IngredientBox extends StatefulWidget {
  final Function(int)
      onIndexChanged; // Callback function to notify index change

  IngredientBox({required this.onIndexChanged});

  @override
  _IngredientBoxState createState() => _IngredientBoxState();
}

class _IngredientBoxState extends State<IngredientBox> {
  static const int defaultPages = 5; // Default number of pages
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
            print(
                'Current Index: $_currentIndex'); // Print current index for debugging
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
                pageIndex: index,
                items: items,
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
  int _numPages =
      5; // Initially set to 3, but can be updated as users add pages

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: appColorTheme.backgroundColor,
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
              SizedBox(height: 10.0),
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
              iconTheme: IconThemeData(
                  color: Colors.black87), // Change the color of the back arrow
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
