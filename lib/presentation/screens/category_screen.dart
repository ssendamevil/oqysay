import 'package:binderbee/presentation/widgets/category_item.dart';
import 'package:binderbee/presentation/widgets/search_appbar.dart';
import 'package:flutter/material.dart';

import '../language_selection/app_localization.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalization.of(context).getTranslatedValues("categories")}',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(category: "Fiction",),
                CategoryItem(category: "Non-Fiction",)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(category: "Fantasy",),
                CategoryItem(category: "Horror",)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(category: "Young Adult"),
                CategoryItem(category: "Crime")
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(category: "Sci-fi",),
                CategoryItem(category: "Drama",)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(category: "Kids",),
                CategoryItem(category: "CD",)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
