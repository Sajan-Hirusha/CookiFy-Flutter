import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart'; 

void main() {
  runApp(const CookiFyApp());
}

class CookiFyApp extends StatelessWidget {
  const CookiFyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CookiFy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
