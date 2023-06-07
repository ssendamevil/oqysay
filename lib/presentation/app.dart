import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:binderbee/data/repositories/data_auth_repository.dart';
import 'package:binderbee/domain/repositories/auth_repository.dart';
import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/bloc/language/language_bloc.dart';
import 'package:binderbee/presentation/language_selection/app_localization.dart';
import 'package:binderbee/presentation/pages/login_page.dart';
import 'package:binderbee/presentation/pages/main_page.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:binderbee/presentation/screens/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../data/datasources/box_helper.dart';
import '../data/repositories/data_book_repository.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/cart/cart_bloc.dart';
import 'bloc/store/store_bloc.dart';
import 'bloc/store/store_event.dart';


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
        RepositoryProvider<AuthRepository>(
            create: (context) => DataAuthRepository(_dio)
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StoreBloc>(
              create: (context) => StoreBloc(context.read<BookRepository>())
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider<LanguageBloc>(
            create: (context) => LanguageBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _storeBloc = context.read<StoreBloc>()
      ..add(StoreGetAllBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ChangeNotifierProvider<NavbarProvider>(
          create: (_) => NavbarProvider(),
          child: MaterialApp(
            localizationsDelegates: AppLocalization.localizationsDelegate,
            supportedLocales: AppLocalization.supportedLocales,
            localeResolutionCallback: AppLocalization.localeResolutionCallBack,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.lightBlue,
                appBarTheme: const AppBarTheme(
                    color: Colors.transparent,
                    elevation: 0
                )
            ),
            home: AnimatedSplashScreen(
              splash: const SplashScreen(),
              splashIconSize: 3000,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: _getFirstPage(),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }

  Widget _getFirstPage() {
    if (!BoxHelper.hasToken()) {
      return const LoginPage();
    }
    return const MainPage();
  }
}

