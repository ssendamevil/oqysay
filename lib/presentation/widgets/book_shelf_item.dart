import 'package:binderbee/presentation/bloc/cart/cart_bloc.dart';
import 'package:binderbee/presentation/bloc/cart/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/models/book.dart';
import '../providers/navbar_provider.dart';

class BookShelfItem extends StatefulWidget {
  const BookShelfItem({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<BookShelfItem> createState() => _BookShelfItemState();
}

class _BookShelfItemState extends State<BookShelfItem> {
  bool isSelected = false;
  void _addToCart(Book book) {
    context.read<CartBloc>().add(AddBookToCartEvent(book));
  }

  @override
  Widget build(BuildContext context) {
    final nb = Provider.of<NavbarProvider>(context);
    return SizedBox(
      width: 150,
      child: OutlinedButton(
        onPressed: () {
          nb.selectedIndex = 5;
          nb.book = widget.book;
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 125,
              height: 180,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(widget.book.image, fit: BoxFit.fill,)
              ),
            ),
            const SizedBox(height: 10,),
            Text( widget.book.title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(height: 5,),
            const Text(
              "Author",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                fontSize: 14
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "2400₸",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: IconButton(
                      focusColor: Colors.black,
                      padding: const EdgeInsets.all(5),
                      onPressed: () {
                        // _addToCart(widget.book);
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      icon: const Icon(
                        Icons.favorite_border_sharp,
                        size: 18,
                        color: Colors.black,
                      ),
                      selectedIcon: const Icon(Icons.favorite,size: 18, color: Colors.black,),
                      isSelected: isSelected,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
