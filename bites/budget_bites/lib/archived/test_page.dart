import 'package:flutter/material.dart';
import 'recipes.dart'; // Import the RecipesPage class

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _items = [];
  final Map<String, bool> _selectedItems = {};
  final List<String> _selectedIngredients = []; // List to store selected ingredient names

  bool _isSearchMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My inventory'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.green, // Set the background color to purple
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: _isSearchMode ? 'Search' : 'Add items',
                              fillColor: Colors.white, // Set the input bar background color to white
                              filled: true,
                            ),
                            onSubmitted: (value) {
                              _isSearchMode ? _searchItems(value) : _addItemToList(context);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isSearchMode = !_isSearchMode;
                              _textEditingController.clear();
                            });
                          },
                          icon: Icon(_isSearchMode ? Icons.add : Icons.search),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    flex: 9,
                    child: SingleChildScrollView(
                      primary: true, // Ensure the SingleChildScrollView is primary
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(), // Disable scrolling in the GridView
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 8.0, // Spacing between columns
                          mainAxisSpacing: 8.0, // Spacing between rows
                        ),
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          final itemName = _items[index];
                          final isSelected = _selectedItems[itemName] ?? false;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItems[itemName] = !isSelected;
                                if (isSelected) {
                                  _selectedIngredients.remove(itemName); // Remove if already selected
                                } else {
                                  _selectedIngredients.add(itemName); // Add if not selected
                                }
                                print('Selected ingredients: $_selectedIngredients'); // Debug print
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blueAccent : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  itemName,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _onFindRecipesPressed(context),
                child: Text('Find Recipes'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addItemToList(BuildContext context) {
    setState(() {
      final text = _textEditingController.text.trim();
      if (text.isNotEmpty && !_items.contains(text)) {
        _items.add(text);
        _textEditingController.clear();
      } else {
        // Show a SnackBar with the message 'Item already in list'
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item already in list'),
            duration: Duration(seconds: 1), // Duration for which the SnackBar is displayed
          ),
        );
      }
    });
  }

  void _searchItems(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, display all items
        _textEditingController.clear();
      } else {
        // Filter items based on the query
        _textEditingController.text = query;
      }
    });
  }

  void _onFindRecipesPressed(BuildContext context) {
    if (_selectedIngredients.isNotEmpty) {
      // Navigate to RecipesPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipesPage(selectedIngredients: _selectedIngredients),
        ),
      );
      print('Selected ingredients for recipes: $_selectedIngredients'); // Debug print
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No ingredients selected'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
