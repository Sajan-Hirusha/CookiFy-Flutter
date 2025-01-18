import 'package:cookify/models/recipe.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/api_service.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.strMeal),
      ),
      body: FutureBuilder<Meal>(
        future: ApiService().fetchMealDetails(recipe.idMeal),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No details available.'));
          } else {
            final meal = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(meal.strMealThumb),
                  SizedBox(height: 16),
                  Text(meal.strMeal, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text('Instructions: ${meal.strInstructions}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
