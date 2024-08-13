import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/ui_shimmers.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'food_kind_animated_container.dart';

class AnimatedShopByCategorySession extends StatefulWidget {
  const AnimatedShopByCategorySession({
    super.key,
  });

  @override
  State<AnimatedShopByCategorySession> createState() => _AnimatedShopByCategorySessionState();
}

class _AnimatedShopByCategorySessionState extends State<AnimatedShopByCategorySession> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToIndex(int index) {
    final double targetPosition = index * 78.0;
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Modular.get<HomeViewController>().selectedFoodKindId,
      builder: (context, selectedNicheId, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: UIPaddings.onlyLeft16,
              child: UIText(
                'Shop by category',
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.start,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                itemCount: Modular.get<HomeViewController>().foodKinds.length,
                scrollDirection: Axis.horizontal,
                padding: UIPaddings.onlyHorizontal16,
                itemBuilder: (context, index) {
                  final foodKind = Modular.get<HomeViewController>().foodKinds[index];
                  return FoodKindAnimatedContainer(
                    foodKind: foodKind,
                    onSelected: () => _scrollToIndex(index),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ShopByCategorySessionShimmer extends StatelessWidget {
  const ShopByCategorySessionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: UIPaddings.onlyLeft16,
          child: RoundedContainerShimmer(
            borderRadius: 14,
            width: 180,
            height: 22,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            physics: const ClampingScrollPhysics(),
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            padding: UIPaddings.onlyHorizontal16,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  RoundedContainerShimmer(
                    height: 70,
                    width: 70,
                    borderRadius: 14,
                  ),
                  SizedBox(height: 4),
                  RoundedContainerShimmer(
                    height: 14,
                    width: 50,
                    borderRadius: 7,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
