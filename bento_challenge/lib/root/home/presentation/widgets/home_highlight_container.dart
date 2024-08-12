import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:flutter/material.dart';

class HomeHighlightContainer extends StatelessWidget {
  const HomeHighlightContainer({
    super.key,
    required this.highlight,
  });

  final HomeHighlightEntity highlight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2.25,
        child: AnimatedScaleUpScaleDownWidget(
          scaleDownFactor: 0.95,
          child: Container(
            decoration: BoxDecoration(
              color: UIColors.shamrock,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: UIScale.heightDevice,
                      child: UIText(
                        highlight.title,
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.center,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -18,
                    top: 0,
                    bottom: -15,
                    child: Image.asset(
                      highlight.iconPath,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
