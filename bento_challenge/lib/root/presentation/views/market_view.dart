import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class MarketView extends StatelessWidget {
  const MarketView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIText(
              "Market is Closed... Forever!",
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            UIText(
              "Explore our market, where dreams are sold and savings are mythical. If you’re looking for a good deal, you've come to the right place. Or maybe not. Who knows? Either way, enjoy browsing through our endless sea of possibilities...or, at least, a couple of pages of random stuff.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
