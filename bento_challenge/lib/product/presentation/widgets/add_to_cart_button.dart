import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum ButtonState { add, loading, remove }

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  ButtonState _buttonState = ButtonState.add;

  void _onTapToAddToCart() async {
    setState(() {
      _buttonState = ButtonState.loading;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _buttonState = ButtonState.remove;
    });
  }

  void _onTapToRemoveFromCart() {
    setState(() {
      _buttonState = ButtonState.add;
    });
  }

  _onTap() {
    if (_buttonState == ButtonState.loading) {
      return;
    }

    if (_buttonState == ButtonState.add) {
      _onTapToAddToCart();
    } else {
      _onTapToRemoveFromCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
      animationDuration: const Duration(milliseconds: 80),
      scaleDownFactor: 0.95,
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 51,
        width: 188,
        decoration: BoxDecoration(
          color: _buttonState == ButtonState.add || _buttonState == ButtonState.loading
              ? UIColors.shamrock
              : UIColors.baliHai.withOpacity(0.35),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: _buttonState == ButtonState.loading
              ? Lottie.asset(
                  'lib/assets/lottie_animations/add-to-cart.json',
                  repeat: false,
                )
              : UIText(
                  _buttonState == ButtonState.add ? 'Add to Cart' : 'Remove from Cart',
                  color: _buttonState == ButtonState.add ? UIColors.blueZodiac : UIColors.blueZodiac,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
        ),
      ),
    );
  }
}
