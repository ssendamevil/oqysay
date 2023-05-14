import 'package:flutter/material.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cart", style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600
            ),),
            Row(
              children: [
                Text("2 items",),
                SizedBox(width: 10,),
                Text("7,990₸"),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
              CartItem(),
            ],
          ),
        ),
      ),
    );
  }
}
