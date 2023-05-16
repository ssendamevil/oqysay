import 'package:binderbee/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BookShelfItem extends StatelessWidget {
  const BookShelfItem({Key? key, required this.image, required this.title}) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            height: 180,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(image, fit: BoxFit.cover,)
            ),
          ),
          Text("title"),
          Text("Author"),
          Text("2400₸")
        ],
      ),
    );
  }
}
