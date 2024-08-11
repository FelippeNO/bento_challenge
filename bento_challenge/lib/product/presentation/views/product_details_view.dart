import 'dart:math' as math;

import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_icon_two_states_button.dart';
import 'package:bento_challenge/core/widgets/primary_back_button.dart';
import 'package:bento_challenge/product/domain/entities/product_details_entity.dart';
import 'package:bento_challenge/product/presentation/views/controllers/product_details_controller.dart';
import 'package:bento_challenge/product/presentation/widgets/add_to_cart_button.dart';
import 'package:bento_challenge/product/presentation/widgets/product_avaliation_container.dart';
import 'package:bento_challenge/product/presentation/widgets/product_category_bar.dart';
import 'package:bento_challenge/product/presentation/widgets/product_details_price_display.dart';
import 'package:bento_challenge/product/presentation/widgets/product_image_carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
  final ProductDetailsEntity product;
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final ProductDetailsController controller = Modular.get<ProductDetailsController>();

  final CarouselSliderController carouselController = CarouselSliderController();

  bool _isBottomBarVisible = false;

  _onBackTap() async {
    await carouselController.animateToPage(
      0,
      duration: const Duration(milliseconds: 80),
      curve: Curves.easeInOut,
    );
    setState(() {
      _isBottomBarVisible = false;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      Modular.to.pop();
    });
  }

  @override
  void initState() {
    super.initState();
    controller.initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 80));
      setState(() {
        _isBottomBarVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: UIScale.deviceTopPadding),
              Container(
                padding: UIPaddings.onlyHorizontal16,
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryBackButton(
                      onBackTap: () => _onBackTap(),
                    ),
                    AnimatedIconTwoStatesButton(isActivated: true, onTap: (isActivated) {}),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageCarouselSlider(
                        carouselController: carouselController,
                        images: widget.product.imagesPath,
                      ),
                      Padding(
                        padding: UIPaddings.onlyHorizontal16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: UIScale.width(65),
                                  child: UIText(
                                    widget.product.name,
                                    color: UIColors.blueZodiac,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 26,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 1),
                                  child: ProductAvaliationContainer(avaliation: '4.5'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            UIText(
                              'Shop: ${widget.product.shop}',
                              color: UIColors.blueZodiac,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 16),
                            ProductCategoryBar(
                              categories: widget.product.categories,
                            ),
                            const SizedBox(height: 16),
                            const UIText(
                              'Details',
                              color: UIColors.blueZodiac,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                            const SizedBox(height: 8),
                            UIText(
                              widget.product.details,
                              color: UIColors.blueZodiac,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.7,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 90 + UIScale.bottomDevicePadding + 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildFixedBottomBar(),
        ],
      ),
    );
  }

  Widget _buildFixedBottomBar() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: const MyElasticOutCurve(1.5),
      bottom: _isBottomBarVisible ? 0 : -90 - UIScale.bottomDevicePadding,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: UIScale.bottomDevicePadding),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: UIColors.baliHai.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            padding: UIPaddings.all16,
            height: 90,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductDetailsPriceDisplay(
                  price: widget.product.price,
                  originalPrice: widget.product.comparativePrice,
                ),
                const AddToCartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyElasticOutCurve extends Curve {
  const MyElasticOutCurve([this.period = 0.4]);

  final double period;

  @override
  double transformInternal(double t) {
    final double s = period / 4.0;
    return math.pow(2.0, -10 * t) * math.sin((t - s) * (math.pi * 2.0) / period) + 1.0;
  }

  @override
  String toString() {
    return '${objectRuntimeType(this, 'ElasticOutCurve')}($period)';
  }
}
