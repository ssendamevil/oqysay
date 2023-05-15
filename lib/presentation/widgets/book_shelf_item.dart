import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookShelfItem extends StatelessWidget {
  const BookShelfItem({Key? key, required this.image, required this.title}) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          height: 180,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey,
          ),
          child: Image.network(image, fit: BoxFit.cover,),
        ),
        Text(title),
        Text("Author"),
        Text("2400₸")
      ],
    );
  }
}
