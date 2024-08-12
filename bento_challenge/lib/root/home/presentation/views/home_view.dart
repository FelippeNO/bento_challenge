import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/product/data/product_details_data.dart';
import 'package:bento_challenge/root/home/data/home_highlight_data.dart';
import 'package:bento_challenge/root/home/data/home_offer_data.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/change_place_animated_widget.dart';
import '../widgets/home_highlights_session.dart';
import '../widgets/offers_main_carousel.dart';
import '../widgets/product_snapshot_container.dart';
import '../widgets/shop_by_category_session.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController homeViewController = Modular.get();

  @override
  void initState() {
    super.initState();
    homeViewController.init();
  }

  List<HomeHighlightEntity> getHighlights() {
    return List.generate(
      2,
      (index) => HomeHighlightEntity(
        title: homeHighlightsData['highlights'][index]['title'],
        iconPath: homeHighlightsData['highlights'][index]['icon_path'],
      ),
    );
  }

  List<HomeOfferEntity> getOffers() {
    return List.generate(
      3,
      (index) => HomeOfferEntity.fromJson(homeOfferData['offers'][index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        children: [
          SizedBox(height: UIScale.deviceTopPadding),
          Container(
            padding: UIPaddings.onlyHorizontal16,
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText(
                      'Delivery',
                      fontWeight: FontWeight.w800,
                    ),
                    ChangePlaceAnimatedWidget(),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: UIColors.fringyFlower,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHighlightsSession(highlights: getHighlights()),
                  const SizedBox(height: 16),
                  OffersMainCarousel(offers: getOffers()),
                  const SizedBox(height: 25),
                  const AnimatedShopByCategorySession(),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: UIPaddings.onlyHorizontal16,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      UIText(
                        'Today\'s Special',
                        fontWeight: FontWeight.w900,
                        textAlign: TextAlign.start,
                        fontSize: 20,
                      ),
                      UIText(
                        'See all',
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.start,
                        fontSize: 17,
                        color: UIColors.shamrock,
                      ),
                    ]),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: UIPaddings.onlyHorizontal16,
                    child: GridView.count(
                      padding: UIPaddings.onlyTop8,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        for (int i = 0; i < productDetailsData['products'].length; i++)
                          ProductSnapshotContainer(productDetailsData['products'][i]),
                      ],
                    ),
                  ),
                  SizedBox(height: 60 + UIScale.bottomDevicePadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
