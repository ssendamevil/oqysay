import 'package:binderbee/presentation/pages/landing_page.dart';
import 'package:binderbee/presentation/pages/main_page.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:binderbee/presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NavbarProvider>(create: (_)=> NavbarProvider())
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0
          )
        ),
        home: const LandingPage(),
    );
  }
}