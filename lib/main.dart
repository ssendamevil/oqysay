import 'package:binderbee/presentation/pages/landing_page.dart';
import 'package:binderbee/presentation/pages/main_page.dart';
import 'package:binderbee/presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const LandingPage(),
    );
  }
}