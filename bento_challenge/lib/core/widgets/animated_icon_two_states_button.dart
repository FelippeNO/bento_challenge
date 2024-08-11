import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:flutter/material.dart';

class AnimatedIconTwoStatesButton extends StatefulWidget {
  const AnimatedIconTwoStatesButton({
    super.key,
    required this.isActivated,
    required this.onTap,
    this.activatedIcon = Icons.favorite,
    this.notActivatedIcon = Icons.favorite_border,
    this.activatedColor = Colors.red,
    this.notActivatedColor = Colors.grey,
  });

  final bool isActivated;
  final Function(bool) onTap;
  final IconData activatedIcon;
  final IconData notActivatedIcon;
  final Color activatedColor;
  final Color notActivatedColor;

  @override
  State<AnimatedIconTwoStatesButton> createState() => _AnimatedIconTwoStatesButtonState();
}

class _AnimatedIconTwoStatesButtonState extends State<AnimatedIconTwoStatesButton> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isActivated;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onTap(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
      animationDuration: const Duration(milliseconds: 80),
      scaleDownFactor: 0.8,
      onTap: () {
        _toggleFavorite();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: UIColors.alabaster,
          shape: BoxShape.circle,
        ),
        height: 37,
        width: 37,
        child: Icon(
          _isFavorite ? widget.activatedIcon : widget.notActivatedIcon,
          color: _isFavorite ? widget.activatedColor : widget.notActivatedColor,
          size: 24,
        ),
      ),
    );
  }
}
