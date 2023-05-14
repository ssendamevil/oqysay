import 'package:binderbee/data/repositories/data_book_repository.dart';
import 'package:binderbee/domain/repositories/book_repository.dart';
import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:binderbee/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BookRepository>(
      create: (context) => DataBookRepository(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<StoreBloc>(
                create: (context) => StoreBloc(context.read<BookRepository>() )
            )
          ],
          child: const MainViewPage()
      ),
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

