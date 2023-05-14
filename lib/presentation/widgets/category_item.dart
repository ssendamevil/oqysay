import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text(
          "Fiction",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Montserrat",
            fontSize: 16,
            color: Colors.white
          ),
        )
      ),
    );
  }
}
