import 'package:binderbee/presentation/bloc/cart/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/book.dart';
import '../bloc/cart/cart_bloc.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void _deleteToCart(Book book) {
    context.read<CartBloc>().add(DeleteBookToCartEvent(book));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Image.network(widget.book.image),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 20.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Fiction",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 14,
                          color: Color(0xFF5A5959)
                        ),
                      ),
                      IconButton(
                        onPressed: () => _deleteToCart(widget.book),
                        icon: const Icon(Icons.close, size: 30,),
                        padding: EdgeInsets.all(0)
                      ),
                    ],
                  ),
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const Text(
                    "Author name",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF223263)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Color(0xFF223263)),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: (){},
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              border: Border.symmetric(horizontal: BorderSide(width: 1)),
                            ),
                            child: const Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: const Color(0xFF223263)),
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                            ),
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                color: const Color(0xFF223263),
                                onPressed: (){},
                                icon: const Icon(Icons.add)
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "2,990₸",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
