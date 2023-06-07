import 'package:binderbee/presentation/bloc/cart/cart_bloc.dart';
import 'package:binderbee/presentation/bloc/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide(
                  color: Color(0xFFCECDCD),
                  width: 1
              ),
            ),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cart", style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600
                ),),
                (state.cartItems.isEmpty) ?
                const Text(
                  'No items',
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ) :
                Row(
                  children: [
                    Text(
                      "${state.cartItems.length} items",
                      style: const TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3F3E3E)
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text(
                      "7,990₸",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: state.cartItems.isEmpty ?
                const Center(child: Text("There is no products in the cart!"))
                    : ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, int index) {
                          return CartItem(book: state.cartItems[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10,);
                        },
                        itemCount: state.cartItems.length
                    )
          ),
        );
      },
    );
  }
}
