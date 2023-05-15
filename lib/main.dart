import 'package:binderbee/presentation/app.dart';
import 'package:binderbee/presentation/app_init.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = await AppInitializer.initialize();
  runApp(App(dio));
}