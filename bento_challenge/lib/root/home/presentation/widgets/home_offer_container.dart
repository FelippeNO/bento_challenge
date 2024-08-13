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
          child: Builder(builder: (context) {
            return switch (offer.imageLayout) {
              ImageLayoutEnum.left => _HomeOfferContainerImageLeftLayout(offer),
              ImageLayoutEnum.right => _HomeOfferContainerImageRightLayout(offer),
              ImageLayoutEnum.center => _HomeOfferContainerImageCenterLayout(offer),
            };
          }),
        ),
      ),
    );
  }
}

class _CallToActionContainer extends StatelessWidget {
  const _CallToActionContainer(
    this.callToActionText, {
    required this.backgroundColor,
    required this.textColor,
  });

  final String? callToActionText;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: UIText(
        callToActionText.toString(),
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _HomeOfferContainerImageRightLayout extends StatelessWidget {
  const _HomeOfferContainerImageRightLayout(
    this.offer,
  );

  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              _OfferTitle(offer: offer),
              const Spacer(),
              if (offer.callToActionText != null) _CallToActionWidget(offer),
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
    );
  }
}

class _OfferTitle extends StatelessWidget {
  const _OfferTitle({
    required this.offer,
  });

  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return UIText(
      offer.title,
      fontSize: 16,
      fontWeight: FontWeight.w900,
    );
  }
}

class _HomeOfferContainerImageLeftLayout extends StatelessWidget {
  const _HomeOfferContainerImageLeftLayout(
    this.offer,
  );

  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UIText(
                offer.smallText ?? '',
                fontSize: 13,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w800,
                color: UIColors.lynch,
              ),
              if (offer.smallText != null) const Spacer(),
              Image.asset(offer.imagePath, width: UIScale.width(30)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              _OfferTitle(offer: offer),
              const Spacer(),
              if (offer.callToActionText != null) _CallToActionWidget(offer),
              if (offer.callToActionText != null) const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomeOfferContainerImageCenterLayout extends StatelessWidget {
  const _HomeOfferContainerImageCenterLayout(
    this.offer,
  );

  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              _OfferTitle(offer: offer),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(offer.imagePath, width: UIScale.width(30)),
            const Spacer(),
            if (offer.callToActionText != null) _CallToActionWidget(offer),
          ],
        ),
      ],
    );
  }
}

class _CallToActionWidget extends StatelessWidget {
  const _CallToActionWidget(this.offer);
  final HomeOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return switch (offer.callToActionStyle) {
      CallToActionStyleEnum.primary => _CallToActionContainer(
          offer.callToActionText,
          backgroundColor: UIColors.blueZodiac,
          textColor: UIColors.shamrock,
        ),
      CallToActionStyleEnum.secondary => _CallToActionContainer(
          offer.callToActionText,
          backgroundColor: UIColors.lightningYellow,
          textColor: UIColors.blueZodiac,
        ),
      CallToActionStyleEnum.tertiary => _CallToActionContainer(
          offer.callToActionText,
          backgroundColor: UIColors.deepBlush,
          textColor: Colors.white,
        ),
      _ => const SizedBox()
    };
  }
}
