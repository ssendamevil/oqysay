import 'package:binderbee/presentation/bloc/store/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navbar_provider.dart';
class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {

  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width*0.37,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage("assets/images/category_image.png"),
          fit: BoxFit.fill
        )
      ),
      child: ElevatedButton(
        onPressed: (){
          nb.selectedIndex = 6;
          nb.category = widget.category;
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        child: Center(
          child: Text(
            widget.category,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Colors.white
            ),
          )
        ),
      ),
    );
  }
}
