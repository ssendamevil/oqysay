import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookShelfItemLoading extends StatelessWidget {
  const BookShelfItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer(
          child: Container(
            width: 125,
            height: 180,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Text("title"),
        Text("Author"),
        Text("2400₸")
      ],
    );
  }
}