import 'package:flutter/material.dart';

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plans'),
        backgroundColor: Color(0xFF0C3732),
      ),
      body: Center(
        child: Text('Meal Plans will be displayed here.'),
      ),
    );
  }
}
