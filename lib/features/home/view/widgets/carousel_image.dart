import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaadidho/common/constants/constants.dart';

class CarouselImage extends StatelessWidget {
  final String carouselImages;
  const CarouselImage({Key? key, required this.carouselImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.bannerImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.asset(
              i,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
