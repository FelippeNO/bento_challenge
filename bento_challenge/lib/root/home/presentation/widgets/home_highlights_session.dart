import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/ui_shimmers.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:flutter/material.dart';

import 'home_highlight_container.dart';

class HomeHighlightsSession extends StatelessWidget {
  const HomeHighlightsSession({
    super.key,
    required this.highlights,
  }) : assert(highlights.length == 2);

  final List<HomeHighlightEntity> highlights;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIPaddings.onlyHorizontal16,
      child: Row(
        children: [
          HomeHighlightContainer(
            highlight: highlights[0],
          ),
          const SizedBox(width: 12),
          HomeHighlightContainer(
            highlight: highlights[1],
          ),
        ],
      ),
    );
  }
}

class HomeHighlightsSessionShimmer extends StatelessWidget {
  const HomeHighlightsSessionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: UIPaddings.onlyHorizontal16,
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 2.25,
              child: RoundedContainerShimmer(
                borderRadius: 14,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: AspectRatio(
              aspectRatio: 2.25,
              child: RoundedContainerShimmer(
                borderRadius: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
