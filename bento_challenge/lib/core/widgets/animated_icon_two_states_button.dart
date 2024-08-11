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
  late bool _isActivated;

  @override
  void initState() {
    super.initState();
    _isActivated = widget.isActivated;
  }

  void _toggleFavorite() {
    setState(() {
      _isActivated = !_isActivated;
    });
    widget.onTap(_isActivated);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
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
          _isActivated ? widget.activatedIcon : widget.notActivatedIcon,
          color: _isActivated ? widget.activatedColor : widget.notActivatedColor,
          size: 24,
        ),
      ),
    );
  }
}
