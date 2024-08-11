import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class DealsView extends StatelessWidget {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIText(
              "Deals You Can't Refuse (But Probably Will)",
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            UIText(
              "Congratulations! You've found our deals page. While we work on getting some actual deals, here's a random fun fact: Honey never spoils. Just like our humor! Check back soon for discounts that might actually save you some money.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
