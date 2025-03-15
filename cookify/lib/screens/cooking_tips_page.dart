import 'package:flutter/material.dart';

class CookingTipsPage extends StatelessWidget {
  const CookingTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cooking Tips & Tricks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0C3732),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cookingTips.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Essential Cooking Tips & Tricks',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF323232),
                ),
              ),
              SizedBox(height: 10),
              _buildTipCard(
                '1. Keep Your Knives Sharp',
                'A sharp knife makes chopping easier and safer than a dull one.',
              ),
              _buildTipCard(
                '2. Taste As You Cook',
                'Regularly taste your food to adjust seasoning as needed.',
              ),
              _buildTipCard(
                '3. Use Fresh Ingredients',
                'Fresh herbs and ingredients enhance flavor and nutritional value.',
              ),
              _buildTipCard(
                '4. Let Meat Rest',
                'Allow cooked meat to rest before cutting to retain juices.',
              ),
              _buildTipCard(
                '5. Cook Pasta in Salty Water',
                'Salted water helps season the pasta as it cooks.',
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0C3732),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C3732),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}