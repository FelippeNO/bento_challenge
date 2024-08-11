import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class ProductCategoryBar extends StatefulWidget {
  const ProductCategoryBar({
    super.key,
  });

  @override
  State<ProductCategoryBar> createState() => _ProductCategoryBarState();
}

class _ProductCategoryBarState extends State<ProductCategoryBar> {
  List<GlobalKey<_ProductCategoryItemState>> keys = [
    GlobalKey<_ProductCategoryItemState>(),
    GlobalKey<_ProductCategoryItemState>(),
    GlobalKey<_ProductCategoryItemState>(),
  ];

  @override
  void initState() {
    super.initState();
    _animateCategories();
  }

  Future<void> _animateCategories() async {
    for (var i = 0; i < keys.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200), () {
        keys[i].currentState?.animate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: UIColors.alabaster,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProductCategoryItem(key: keys[0]),
          ProductCategoryItem(key: keys[1]),
          ProductCategoryItem(key: keys[2]),
        ],
      ),
    );
  }
}

class ProductCategoryItem extends StatefulWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  void animate() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: SizedBox(
            width: 80,
            height: 58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.energy_savings_leaf,
                    color: UIColors.blueZodiac,
                  ),
                ),
                const UIText(
                  'Vegetarian',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: UIColors.blueZodiac,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
