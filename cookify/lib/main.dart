import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/category_page.dart';

void main() {
  runApp(MealDBApp());
}

class MealDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealDB App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
