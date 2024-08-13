import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FoodKindAnimatedContainer extends StatelessWidget {
  const FoodKindAnimatedContainer({
    super.key,
    required this.foodKind,
    required this.onSelected,
  });

  final FoodKindEntity foodKind;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: Modular.get<HomeViewController>().selectedFoodKindId,
          builder: (context, selectedFoodKindId, child) {
            bool isSelected = selectedFoodKindId == foodKind.id;
            return AnimatedScaleUpScaleDownWidget(
              scaleDownFactor: 0.95,
              onTap: () {
                Modular.get<HomeViewController>().selectedFoodKindId.value = foodKind.id;
                onSelected();
              },
              child: GestureDetector(
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 150),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: isSelected ? UIColors.whiteIce : UIColors.alabaster,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: UIPaddings.all8,
                    child: Image.asset(
                      foodKind.iconPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 4),
        UIText(
          foodKind.name,
          color: UIColors.blueZodiac,
          fontWeight: FontWeight.w800,
        ),
      ],
    );
  }
}
