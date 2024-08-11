import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/widgets/animated_icon_two_states_button.dart';
import 'package:bento_challenge/core/widgets/primary_back_button.dart';
import 'package:bento_challenge/product/presentation/views/controllers/product_details_controller.dart';
import 'package:bento_challenge/product/presentation/widgets/add_to_cart_button.dart';
import 'package:bento_challenge/product/presentation/widgets/product_avaliation_container.dart';
import 'package:bento_challenge/product/presentation/widgets/product_category_bar.dart';
import 'package:bento_challenge/product/presentation/widgets/product_details_price_display.dart';
import 'package:bento_challenge/product/presentation/widgets/product_image_carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final ProductDetailsController controller = Modular.get<ProductDetailsController>();

  final CarouselSliderController carouselController = CarouselSliderController();
  final List<String> list = [
    'cabbage.png',
    'cabbage.png',
    'cabbage.png',
  ];

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: UIScale.deviceTopPadding),
          Container(
            padding: UIPaddings.onlyHorizontal16,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrimaryBackButton(),
                AnimatedIconTwoStatesButton(isActivated: true, onTap: (isActivated) {}),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: UIPaddings.onlyHorizontal16,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageCarouselSlider(carouselController: carouselController, list: list),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: UIScale.width(65),
                          child: const UIText(
                            'Organic Fresh Green Cabbage',
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
                    const UIText(
                      'Shop: Alisha Mart',
                      color: UIColors.blueZodiac,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                    const ProductCategoryBar(),
                    const SizedBox(height: 16),
                    const UIText(
                      'Details',
                      color: UIColors.blueZodiac,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 8),
                    const UIText(
                      'More commonly known as green cabbage, the cannonball cabbage is one of the most popular cabbage varieties. It is so named for the way its leaves are wound tightly over one another, with the final product resembling a cannonball.',
                      color: UIColors.blueZodiac,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.7,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildFixedBottomBar(),
        ],
      ),
    );
  }

  Widget _buildFixedBottomBar() {
    return Container(
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductDetailsPriceDisplay(
            price: '6.90',
            originalPrice: '8.15',
          ),
          AddToCartButton(),
        ],
      ),
    );
  }
}
