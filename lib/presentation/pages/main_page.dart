import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<StoreBloc>(
              create: (context) => StoreBloc(context.read<BookRepository>() )
          )
        ],
        child: ChangeNotifierProvider<NavbarProvider>(
          create: (_)=> NavbarProvider(),
          child: const MainViewPage(),
        )
    );
  }
}

class MainViewPage extends StatefulWidget {
  const MainViewPage({Key? key}) : super(key: key);

  @override
  State<MainViewPage> createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {

  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);
    return Scaffold(
        body: nb.items[nb.selectedIndex].widget,
        bottomNavigationBar: NavigationBar(
            selectedIndex: nb.selectedIndex,
            onDestinationSelected: (i) {
              nb.selectedIndex = i;
            },
            destinations: nb.items.map((e) =>
                NavigationDestination(icon: Icon(e.iconData), label: ""))
                .toList()
        )
    );
  }
}

