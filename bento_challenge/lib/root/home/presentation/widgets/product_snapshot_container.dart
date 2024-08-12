import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/root/navbar/controller/my_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductSnapshotContainer extends StatelessWidget {
  const ProductSnapshotContainer(this.productDetailsData, {super.key});

  final Map<String, dynamic> productDetailsData;

  ProductDetailsEntity get product => ProductDetailsEntity.fromMap(productDetailsData);

  @override
  Widget build(BuildContext context) {
    return AnimatedScaleUpScaleDownWidget(
      onTap: () {
        MyBottomNavBarController bNavBarController = Modular.get();
        bNavBarController.changeVisibility(to: false);
        Modular.to.pushNamed(
          '/product/details',
          arguments: {
            'product': product,
          },
        ).then((value) {
          bNavBarController.changeVisibility(to: true);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: product.backgroundColor,
        ),
        child: Padding(
          padding: UIPaddings.all16,
          child: Hero(
            tag: product.imagesPath[0],
            child: Image.asset(
              product.imagesPath[0],
            ),
          ),
        ),
      ),
    );
  }
}
