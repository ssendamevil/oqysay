import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({Key? key, required this.productImageList}) : super(key: key);

  final List<String> productImageList;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _current = 0;
  List<Widget>? imageSlider;

  @override
  void initState() {
    imageSlider = widget.productImageList.map((e) => Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: e,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
              fit: BoxFit.fill,
              width: 130,
              height: 210,
            )
          ],
        ),
      ),
    )).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 7/4,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason){
                    setState(() {
                      _current = index;
                    });
                  }
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.productImageList.map((e) {
              int index = widget.productImageList.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? const Color(0xFF223263) : const Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
          ],
      ),
    );
  }
}
