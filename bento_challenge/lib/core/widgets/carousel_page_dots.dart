import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:flutter/material.dart';

class CarouselPageDots extends StatelessWidget {
  const CarouselPageDots({
    super.key,
    required this.length,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int length;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < length; i++)
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
