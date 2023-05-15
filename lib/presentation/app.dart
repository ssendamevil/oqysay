import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/pages/landing_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/data_book_repository.dart';


class App extends StatelessWidget {
  final Dio _dio;

  const App(this._dio, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BookRepository>(
          create: (context) => DataBookRepository(_dio),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

