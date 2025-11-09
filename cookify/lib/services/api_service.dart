import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/recipe.dart';
import '../models/meal.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  // Fetch categories
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('${baseUrl}categories.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Category> categories = (data['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Fetch recipes by category
  Future<List<Recipe>> fetchRecipesByCategory(String category) async {
    final response = await http.get(Uri.parse('${baseUrl}filter.php?c=$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Recipe> recipes = (data['meals'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList();
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  // Fetch recipe details
  Future<Meal> fetchMealDetails(String idMeal) async {
    final response = await http.get(Uri.parse('${baseUrl}lookup.php?i=$idMeal'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Meal.fromJson(data['meals'][0]);
    } else {
      throw Exception('Failed to load meal details');
    }
  }

  // Fetch meal details by name
  Future<List<Recipe>> fetchMealDetailsByName(String name) async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}search.php?s=$name'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['meals'] != null) {
          return (data['meals'] as List)
              .map((meal) => Recipe.fromJson(meal))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to fetch meal details by name');
      }
    } catch (e) {
      rethrow;
    }
  }
}
