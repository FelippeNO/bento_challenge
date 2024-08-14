import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class ProductAvaliationContainer extends StatelessWidget {
  const ProductAvaliationContainer({
    super.key,
    required this.avaliation,
  });

  final String avaliation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 29,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: UIColors.alabaster,
          width: 2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: UIColors.lightningYellow,
            size: 19,
          ),
          const SizedBox(width: 4),
          UIText(
            avaliation,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
