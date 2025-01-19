import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import 'recipe_detail_page.dart';

class RecipePage extends StatelessWidget {
  final Category category;

  const RecipePage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${category.strCategory} Recipes'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: ApiService().fetchRecipesByCategory(category.strCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No recipes found.'));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(recipe: recipe),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.network(recipe.strMealThumb),
                    title: Text(recipe.strMeal),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
