import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.images.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _currentIndex == i ? 25 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _currentIndex == i ? UIColors.shamrock : UIColors.parisWhite,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
