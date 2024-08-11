import 'package:flutter/material.dart';

class AnimatedScaleUpScaleDownWidget extends StatefulWidget {
  const AnimatedScaleUpScaleDownWidget({
    super.key,
    required this.child,
    this.onTap,
    this.animationDuration = const Duration(milliseconds: 80),
    this.scaleDownFactor = 0.8,
  });

  final Widget child;
  final Function()? onTap;
  final Duration animationDuration;
  final double scaleDownFactor;

  @override
  State<AnimatedScaleUpScaleDownWidget> createState() => _AnimatedScaleUpScaleDownWidgetState();
}

class _AnimatedScaleUpScaleDownWidgetState extends State<AnimatedScaleUpScaleDownWidget> {
  double _scale = 1.0;

  void _animateButton() {
    setState(() {
      _scale = widget.scaleDownFactor;
    });
  }

  void _resetButton() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _animateButton();
        await Future.delayed(const Duration(milliseconds: 80));
        _resetButton();
        widget.onTap?.call();
      },
      onTapDown: (value) {
        _animateButton();
      },
      onTapUp: (value) {
        _resetButton();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: widget.animationDuration,
        child: widget.child,
      ),
    );
  }
}
