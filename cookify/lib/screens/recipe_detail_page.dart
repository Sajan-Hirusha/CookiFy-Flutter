import 'package:cookify/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this package to handle YouTube links
import '../models/meal.dart';
import '../services/api_service.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  // Function to open a URL
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      meal.strMealThumb,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      meal.strMeal,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Instructions:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      meal.strInstructions,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    if (meal.strYoutube != null && meal.strYoutube!.isNotEmpty)
                      TextButton(
                        onPressed: () => _launchUrl(meal.strYoutube!),
                        child: Text(
                          'Watch on YouTube',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
