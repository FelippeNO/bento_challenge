import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsPriceDisplay extends StatefulWidget {
  const ProductDetailsPriceDisplay({
    super.key,
    required this.price,
    this.originalPrice,
  });

  final String price;
  final String? originalPrice;

  @override
  State<ProductDetailsPriceDisplay> createState() => _ProductDetailsPriceDisplayState();
}

class _ProductDetailsPriceDisplayState extends State<ProductDetailsPriceDisplay> with TickerProviderStateMixin {
  late AnimationController _elasticController;
  late AnimationController _lineController;
  late Animation<double> _elasticAnimation;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();

    _elasticController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _elasticAnimation = Tween<double>(begin: 1, end: 1.3).animate(CurvedAnimation(
      parent: _elasticController,
      curve: Curves.elasticInOut,
    ));

    _elasticController.forward().then((_) {
      _elasticController.reverse();
    });

    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _lineController,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.originalPrice != null) {
      _lineController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UIText(
          'Price',
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: UIColors.baliHai,
        ),
        Row(
          children: [
            AnimatedBuilder(
              animation: _elasticAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _elasticAnimation.value,
                  child: child,
                );
              },
              child: UIText(
                '\$${widget.price}',
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: UIColors.blueZodiac,
              ),
            ),
            if (widget.originalPrice != null)
              TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    begin: UIColors.blueZodiac,
                    end: UIColors.baliHai,
                  ),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, color, child) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 4,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          UIText(
                            '\$${widget.originalPrice}',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: color ?? UIColors.baliHai,
                          ),
                          AnimatedBuilder(
                            animation: _lineAnimation,
                            builder: (context, child) {
                              return CustomPaint(
                                size: Size(_lineAnimation.value * 45, 0.3),
                                painter: _LinePainter(),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _elasticController.dispose();
    _lineController.dispose();
    super.dispose();
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = UIColors.baliHai
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
