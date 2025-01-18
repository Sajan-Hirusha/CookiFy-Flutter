import 'package:flutter/material.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CookiFy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0C3732),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cookifyBackground.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                ),
              ),
            ),
            SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to MealDB App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Description Text Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Explore different categories and recipes to satisfy your taste buds.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 40),

            // Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Navigate to the Category Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryPage()),
                  );
                },
                child: Text(
                  'View Categories',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
