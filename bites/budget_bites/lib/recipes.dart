import 'package:flutter/material.dart';
import 'recipe_api.dart';

class RecipesPage extends StatefulWidget {
  final List<String> selectedIngredients;

  const RecipesPage({Key? key, required this.selectedIngredients}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    try {
      final List<Recipe> fetchedRecipes = await RecipeAPI.fetchRecipes(widget.selectedIngredients);
      setState(() {
        recipes = fetchedRecipes;
        isLoading = false;
      });
      // Print recipes into the terminal for debugging
      print('Recipes: $recipes');
    } catch (e) {
      print('Error fetching recipes: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.green, // Set the background color to green
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 8.0, // Spacing between columns
                  mainAxisSpacing: 8.0, // Spacing between rows
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // Set the card background color to white
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                            recipes[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              recipes[index].title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
