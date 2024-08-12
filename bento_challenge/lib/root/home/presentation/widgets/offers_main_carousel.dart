import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/carousel_page_dots.dart';

class OffersMainCarousel extends StatefulWidget {
  const OffersMainCarousel({
    super.key,
  });

  @override
  State<OffersMainCarousel> createState() => _OffersMainCarouselState();
}

class _OffersMainCarouselState extends State<OffersMainCarousel> {
  int _currentIndex = 0;

  List<Color> colors = [
    UIColors.beige,
    UIColors.riceColor,
    UIColors.cruise,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: colors.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: UIPaddings.onlyHorizontal16,
              child: Container(
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.25,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        CarouselPageDots(length: colors.length, currentIndex: _currentIndex),
      ],
    );
  }
}
