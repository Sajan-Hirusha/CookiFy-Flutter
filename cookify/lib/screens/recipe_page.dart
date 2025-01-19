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
        title: Text(
          '${category.strCategory} Recipes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        backgroundColor: Color(0xFF0C3732),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 4.0, // Adds shadow for a modern feel
      ),
      body: FutureBuilder<List<Recipe>>(
        future: ApiService().fetchRecipesByCategory(category.strCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No recipes found.', style: TextStyle(fontSize: 18, color: Colors.grey)));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
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
                  child: Card(
                    elevation: 5.0, // Adds shadow to each item for depth
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Rounded corners for a modern look
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0), // Rounded image corners
                            child: Image.network(
                              recipe.strMealThumb,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.strMeal,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Ensures long titles are handled properly
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Click for details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF0C3732),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
