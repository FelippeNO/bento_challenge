import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/carousel_page_dots.dart';

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
            return AnimatedScaleUpScaleDownWidget(
              scaleDownFactor: 0.98,
              child: Padding(
                padding: UIPaddings.onlyHorizontal16,
                child: Container(
                  padding: UIPaddings.all16,
                  decoration: BoxDecoration(
                    color: widget.offers[index].backgroundColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            UIText(
                              offer.smallText ?? '',
                              fontSize: 13,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w800,
                              color: UIColors.lynch,
                            ),
                            if (offer.smallText != null) const Spacer(),
                            UIText(
                              offer.title,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                            const Spacer(),
                            if (offer.callToActionText != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: UIColors.blueZodiac,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: UIText(
                                  offer.callToActionText!,
                                  color: UIColors.shamrock,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            if (offer.callToActionText != null) const Spacer(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(offer.imagePath, width: UIScale.width(30)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
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
