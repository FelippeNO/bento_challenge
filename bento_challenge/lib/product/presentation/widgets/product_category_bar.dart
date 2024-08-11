import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/product/domain/entities/product_category_entity.dart';
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
          ProductCategoryItem(
            item: ProductCategoryEntity(
                name: 'Vegetarian',
                id: '1',
                iconPath: './lib/assets/png_icons/leaf.png',
                backgroundColor: UIColors.madang),
            key: keys[0],
          ),
          ProductCategoryItem(
              item: ProductCategoryEntity(
                  name: 'Halal Food',
                  id: '1',
                  iconPath: './lib/assets/png_icons/halal.png',
                  backgroundColor: UIColors.mintJulep),
              key: keys[1]),
          ProductCategoryItem(
              item: ProductCategoryEntity(
                  name: 'Gluten-free',
                  id: '1',
                  iconPath: './lib/assets/png_icons/gluten-free.png',
                  backgroundColor: UIColors.cruise),
              key: keys[2]),
        ],
      ),
    );
  }
}

class ProductCategoryItem extends StatefulWidget {
  const ProductCategoryItem({
    super.key,
    required this.item,
  });

  final ProductCategoryEntity item;

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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.item.backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      widget.item.iconPath,
                      color: UIColors.blueZodiac,
                    ),
                  ),
                ),
                UIText(
                  widget.item.name,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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
