import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:flutter/material.dart';

class HomeOfferContainer extends StatelessWidget {
  const HomeOfferContainer({
    super.key,
    required this.offer,
  });

  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
      scaleDownFactor: 0.98,
      child: Padding(
        padding: UIPaddings.onlyHorizontal16,
        child: Container(
          padding: UIPaddings.all16,
          decoration: BoxDecoration(
            color: offer.backgroundColor,
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
  }
}
