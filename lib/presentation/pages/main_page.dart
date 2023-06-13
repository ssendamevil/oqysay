import 'package:binderbee/presentation/pages/category_page.dart';
import 'package:binderbee/presentation/pages/category_spe_page.dart';
import 'package:binderbee/presentation/pages/product_page.dart';
import 'package:binderbee/presentation/providers/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/book.dart';

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

  int _switchNavigation(int si){
    switch(si){
      case 5 : {
        return 0;
      }
      case 6 : {
        return 1;
      }
      case 7: {
        return 1;
      }
    }

    return si;
  }

  // Widget _switchPages(int si, Book book, List<NavbarDTO> items){
  //   switch(si){
  //     case 5 : {
  //       return ProductPage(book: book);
  //     }
  //     case 6 : {
  //       return const CategoryPage();
  //     }
  //   }
  //
  //   return items[si].widget;
  // }

  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);

    Widget switchPages(int si){
      switch(si){
        case 5 : {
          return ProductPage(book: nb.book);
        }
        case 6 : {
          return CategoryPage(categoryName: nb.category,);
        }
        case 7: {
          return CategorySpePage(categoryName: nb.category,books: nb.bookByCategory,);
        }
      }

      return nb.items[si].widget;
    }

    return Scaffold(
        body: switchPages(nb.selectedIndex),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _switchNavigation(nb.selectedIndex),
          onDestinationSelected: (i) {
            nb.selectedIndex = i;
          },
          destinations: nb.items.map((e) =>
              NavigationDestination(icon: Icon(e.iconData), label: ""))
              .toList(),
          height: 50,
        )
    );
  }
}

