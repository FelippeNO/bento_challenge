import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircularContainerShimmer extends StatelessWidget {
  const CircularContainerShimmer({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: UIColors.shimmerBaseColor,
      highlightColor: UIColors.shimmerHighlightColor,
      child: Container(
        alignment: Alignment.centerLeft,
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}

class RoundedContainerShimmer extends StatelessWidget {
  const RoundedContainerShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 18,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: UIColors.shimmerBaseColor,
      highlightColor: UIColors.shimmerHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
