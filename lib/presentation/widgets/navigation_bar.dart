import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required List<NavigationDestination> destinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_filled), label: ""),
        NavigationDestination(icon: Icon(Icons.category_rounded), label: ""),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: ""),
        NavigationDestination(icon: Icon(Icons.person_2_rounded), label: ""),
      ],
    );
  }
}
