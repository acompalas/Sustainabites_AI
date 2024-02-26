import 'dart:convert';
import 'package:http/http.dart' as http;

class Recipe {
  final int id;
  final String title;
  final String image;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class RecipeAPI {
  static Future<List<Recipe>> fetchRecipes(List<String> selectedIngredients, {String? cuisine}) async {
    final apiKey = '28211f3954474589825fc9c5345ac3d7';
    final ingredientsQuery = selectedIngredients.join(',+');
    final cuisineQuery = cuisine != null ? '&cuisine=$cuisine' : '';
    final uri = Uri.parse('https://api.spoonacular.com/recipes/findByIngredients?ingredients=$ingredientsQuery&number=10&apiKey=$apiKey');
    print('Final URI: $uri');

    final response = await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final List<dynamic> recipesJson = jsonDecode(response.body);
      List<Recipe> recipes = [];
      for (var recipeJson in recipesJson) {
        recipes.add(Recipe.fromJson(recipeJson));
      }
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
