import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/ui_shimmers.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:bento_challenge/root/home/presentation/widgets/product_snapshot_container.dart';
import 'package:flutter/material.dart';

class HomeProductsGridSession extends StatelessWidget {
  const HomeProductsGridSession({
    super.key,
    required this.session,
  });

  final HomeProductsSessionEntity session;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: UIPaddings.onlyHorizontal16,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          UIText(
            session.name,
            fontWeight: FontWeight.w900,
            textAlign: TextAlign.start,
            fontSize: 20,
          ),
          const UIText(
            'See all',
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.start,
            fontSize: 17,
            color: UIColors.shamrock,
          ),
        ]),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: UIPaddings.onlyHorizontal16,
        child: GridView.count(
          padding: UIPaddings.onlyTop8,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.8,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            for (final product in session.productSnapshots) ProductSnapshotContainer(product),
          ],
        ),
      ),
    ]);
  }
}

class HomeProductsGridSessionShimmer extends StatelessWidget {
  const HomeProductsGridSessionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: UIPaddings.onlyHorizontal16,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RoundedContainerShimmer(
              height: 22,
              width: 150,
            ),
            RoundedContainerShimmer(
              height: 19,
              width: 60,
            ),
          ]),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: UIPaddings.onlyHorizontal16,
          child: GridView.count(
            padding: UIPaddings.onlyTop8,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 0.8,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              for (int i = 0; i < 4; i++) const ProductSnapshotContainerShimmer(),
            ],
          ),
        ),
      ],
    );
  }
}
