import 'package:binderbee/presentation/widgets/book_shelf_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/book.dart';
import '../language_selection/app_localization.dart';
import '../providers/navbar_provider.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key, required this.books}) : super(key: key);
  final List<Book> books;

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppLocalization.of(context).getTranslatedValues("100_top_bestsellers")}',
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Monstserrat",
                  fontWeight: FontWeight.w500
                ),
              ),
              TextButton(
                onPressed: (){
                  nb.selectedIndex = 5;
                  nb.category = "fiction";
                },
                child: Row(
                  children: [
                    Text(
                      '${AppLocalization.of(context).getTranslatedValues("see_all")}',
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: Colors.black
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.black,
                    )
                  ],
                )
              )
            ],
          ),
          SizedBox(
            height: 310,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return BookShelfItem(book: widget.books[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10,);
              },
              itemCount: widget.books.length,
            ),
          ),
        ],
      ),
    );
  }
}
