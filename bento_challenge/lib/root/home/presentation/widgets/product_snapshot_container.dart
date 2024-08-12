import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
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
        Modular.to.pushNamed(
          '/product/details',
          arguments: {
            'product': product,
          },
        );
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
