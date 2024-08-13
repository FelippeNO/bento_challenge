import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_scale_up_scale_down_widget.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
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
          padding: UIPaddings.all8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.star,
                    color: UIColors.lightningYellow,
                    size: 14,
                  ),
                  UIText(
                    " ${product.rating}",
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ],
              ),
              Expanded(
                flex: 7,
                child: Hero(
                  tag: product.imagesPath[0],
                  child: Image.asset(
                    product.imagesPath[0],
                    width: UIScale.width(27),
                    height: UIScale.width(27),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIText(
                                product.shortName,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              const Spacer(),
                              Row(children: [
                                UIText(
                                  "\$${product.price}",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                                if (product.comparativePrice != null) ...[
                                  const SizedBox(width: 5),
                                  UIText(
                                    "\$${product.comparativePrice}",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: UIColors.baliHai,
                                    textDecoration: TextDecoration.lineThrough,
                                  ),
                                ],
                              ]),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Modular.get<HomeViewController>().addOrRemoveProductFromCart(product.id);
                          },
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ValueListenableBuilder(
                                valueListenable: Modular.get<HomeViewController>().productInCartIds,
                                builder: (context, productInCartIds, _) {
                                  final bool isInCart = productInCartIds.contains(product.id);
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: !isInCart ? UIColors.shamrock : UIColors.baliHai.withOpacity(0.35),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Icon(
                                      !isInCart ? Icons.add : Icons.check,
                                      color: UIColors.blueZodiac,
                                      size: 20,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
