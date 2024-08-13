import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/ui_shimmers.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/carousel_page_dots.dart';
import 'home_offer_container.dart';

class OffersMainCarousel extends StatefulWidget {
  const OffersMainCarousel({
    required this.offers,
    super.key,
  });

  final List<HomeOfferEntity> offers;

  @override
  State<OffersMainCarousel> createState() => _OffersMainCarouselState();
}

class _OffersMainCarouselState extends State<OffersMainCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.offers.length,
          itemBuilder: (context, index, realIndex) {
            final offer = widget.offers[index];
            return HomeOfferContainer(offer: offer);
          },
          options: CarouselOptions(
            autoPlay: false,
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
        CarouselPageDots(length: widget.offers.length, currentIndex: _currentIndex),
      ],
    );
  }
}

class HomeOffersMainCarouselShimmer extends StatelessWidget {
  const HomeOffersMainCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AspectRatio(
          aspectRatio: 2.25,
          child: Padding(
            padding: UIPaddings.onlyHorizontal16,
            child: RoundedContainerShimmer(
              borderRadius: 14,
            ),
          ),
        ),
        SizedBox(height: 8 + 6),
      ],
    );
  }
}
