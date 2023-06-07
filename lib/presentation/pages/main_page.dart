import 'package:binderbee/presentation/pages/product_page.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainViewPage();
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
        body: nb.selectedIndex == 5 ? ProductPage(book: nb.book) : nb.items[nb.selectedIndex].widget,
        bottomNavigationBar: NavigationBar(
            selectedIndex: nb.selectedIndex == 5 ? 0 : nb.selectedIndex,
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

