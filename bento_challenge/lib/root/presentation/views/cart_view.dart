import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIText(
              'Your Shopping Cart is as Empty as My Wallet!',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            UIText(
              "It seems like you haven't added anything to your cart yet. Either you're practicing self-control or just here to browse. No judgment! We both know browsing is free, unlike my student loans.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
