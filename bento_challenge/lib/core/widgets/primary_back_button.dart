import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({
    super.key,
    this.onBackTap,
  });

  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
      animationDuration: const Duration(milliseconds: 80),
      scaleDownFactor: 0.8,
      onTap: () {
        if (onBackTap != null) {
          onBackTap!();
          return;
        }
        Modular.to.pop();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: UIColors.alabaster,
          shape: BoxShape.circle,
        ),
        height: 37,
        width: 37,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 21,
        ),
      ),
    );
  }
}
