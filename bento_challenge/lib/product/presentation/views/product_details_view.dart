import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/widgets/animated_icon_two_states_button.dart';
import 'package:bento_challenge/product/presentation/views/controllers/product_details_controller.dart';
import 'package:bento_challenge/product/presentation/widgets/add_to_cart_button.dart';
import 'package:bento_challenge/product/presentation/widgets/product_details_price_display.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/widgets/primary_back_button.dart';
import '../widgets/product_avaliation_container.dart';
import '../widgets/product_category_bar.dart';
import '../widgets/product_image_carousel_slider.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final ProductDetailsController controller = Modular.get<ProductDetailsController>();

  final CarouselSliderController carouselController = CarouselSliderController();
  final List<Widget> list = [
    Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    ),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    )
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
      body: Padding(
        padding: UIPaddings.onlyHorizontal16,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 90),
                  const PrimaryBackButton(),
                  AnimatedIconTwoStatesButton(
                    isActivated: false,
                    onTap: (isFavorite) {},
                  ),
                  const ProductAvaliationContainer(avaliation: '4.5'),
                ],
              ),
              const ProductCategoryBar(),
              const AddToCartButton(),
              const ProductDetailsPriceDisplay(price: "6.90", originalPrice: "8.15"),
              ProductImageCarouselSlider(carouselController: carouselController, list: list),
            ],
          ),
        ),
      ),
    );
  }
}
