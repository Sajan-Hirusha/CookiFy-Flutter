import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MealDBApp());
}

class MealDBApp extends StatelessWidget {
  const MealDBApp({super.key});

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
