import 'package:binderbee/presentation/language_selection/app_localization.dart';
import 'package:binderbee/presentation/widgets/book_shelf_item.dart';
import 'package:flutter/material.dart';

import '../../domain/models/book.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({Key? key, required this.books}) : super(key: key);
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                '${AppLocalization.of(context).getTranslatedValues("100_top_bestsellers")}',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Monstserrat",
                  fontWeight: FontWeight.w500
                ),
              ),
              TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text(
                      '${AppLocalization.of(context).getTranslatedValues("see_all")}',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: Colors.black
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.black,
                    )
                  ],
                )
              )
            ],
          ),
          SizedBox(
            height: 350,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return BookShelfItem(book: books[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10,);
              },
              itemCount: books.length,
            ),
          ),
        ],
      ),
    );
  }
}
