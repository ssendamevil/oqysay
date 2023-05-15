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
                "100 Top Bestsellers",
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
                      "see all",
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
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return BookShelfItem(image: books[index].image, title: books[index].title,);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 30,);
              },
              itemCount: books.length,
            ),
          ),
        ],
      ),
    );
  }
}
