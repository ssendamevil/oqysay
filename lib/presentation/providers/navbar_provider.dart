import 'package:binderbee/presentation/pages/main_page.dart';
import 'package:binderbee/presentation/screens/account_screen.dart';
import 'package:binderbee/presentation/screens/cart_screen.dart';
import 'package:binderbee/presentation/screens/category_screen.dart';
import 'package:binderbee/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavbarProvider with ChangeNotifier{
  List<NavbarDTO> items = [
    NavbarDTO(label: "", widget: HomeScreen(), iconData: Icons.home_filled),
    NavbarDTO(label: "", widget: const CategoryScreen(), iconData: Icons.category_rounded),
    NavbarDTO(label: "", widget: const CartScreen(), iconData: Icons.shopping_cart),
    NavbarDTO(label: "", widget: const AccountScreen(), iconData: Icons.person_2_rounded),
  ];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }


}

class NavbarDTO{
  Widget? widget;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData});
}