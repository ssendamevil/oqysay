import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookShelfItem extends StatelessWidget {
  const BookShelfItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer(
          child: Container(
            width: 130,
            height: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey,
            ),
          ),
        ),
        Text("Title"),
        Text("Author"),
        Text("2400₸")
      ],
    );
  }
}
