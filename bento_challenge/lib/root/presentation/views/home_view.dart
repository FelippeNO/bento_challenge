import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/product/data/product_details_data.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 400),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: AnimatedScaleUpScaleDownWidget(
              onTap: () {
                Modular.to.pushNamed('/product/details', arguments: {
                  'product': ProductDetailsEntity.fromMap(productDetailsData['products'][0]),
                });
              },
              child: Container(
                height: 200,
                width: 200,
                color: UIColors.shamrock,
                child: Padding(
                  padding: UIPaddings.all16,
                  child: Hero(
                    tag: 'product_image',
                    child: Image.asset(
                      'lib/assets/images/cabbage0.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
