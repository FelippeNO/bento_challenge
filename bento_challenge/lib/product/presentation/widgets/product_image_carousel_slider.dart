import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/carousel_page_dots.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
    required this.carouselController,
    required this.images,
  });

  final CarouselSliderController carouselController;
  final List<String> images;

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width, // UIScale.widthDevice
          child: CarouselSlider.builder(
            carouselController: widget.carouselController,
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return Hero(tag: widget.images[0], child: Image.asset(widget.images[index]));
            },
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        CarouselPageDots(length: widget.images.length, currentIndex: _currentIndex),
      ],
    );
  }
}
