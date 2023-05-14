import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              width: 100,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fiction"),
                      IconButton(onPressed: (){},
                        icon: Icon(Icons.close),
                        padding: EdgeInsets.zero
                      ),
                    ],
                  ),
                  Text("Book title"),
                  Text("Author name"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Counter"),
                      Text("2,9900")
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
