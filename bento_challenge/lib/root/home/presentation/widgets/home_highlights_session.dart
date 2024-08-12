import 'package:bento_challenge/core/design/ui_paddings.dart';
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
