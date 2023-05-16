import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderLoaded extends StatefulWidget {
  const CarouselSliderLoaded({Key? key, required this.carouselList}) : super(key: key);

  final List<String> carouselList;

  @override
  State<CarouselSliderLoaded> createState() => _CarouselSliderLoadedState();
}

class _CarouselSliderLoadedState extends State<CarouselSliderLoaded> {
  int _current = 0;
  List<Widget>? imageSlider;

  @override
  void initState() {
    imageSlider = widget.carouselList.map((e) => Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: e,
              errorWidget: (context, url, error) => Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              fit: BoxFit.cover,
              width: 1000,
              height: 300,
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
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 30),
                aspectRatio: 16/9,
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
            children: widget.carouselList.map((e) {
              int index = widget.carouselList.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color(0xFF223263) : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
