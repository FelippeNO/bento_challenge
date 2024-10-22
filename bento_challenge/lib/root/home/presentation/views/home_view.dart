import 'package:bento_challenge/core/design/ui_paddings.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/core/design/ui_text.dart';
import 'package:bento_challenge/core/enums/basic_state_view.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/avatar_circle.dart';
import '../widgets/change_place_animated_widget.dart';
import '../widgets/home_highlights_session.dart';
import '../widgets/home_products_grid_session.dart';
import '../widgets/offers_main_carousel.dart';
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
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                AvatarCircle(),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                homeViewController.init();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: homeViewController.homeHighlightsState,
                      builder: (context, state, _) => switch (state) {
                        BasicStateView.loading => const HomeHighlightsSessionShimmer(),
                        BasicStateView.success => HomeHighlightsSession(highlights: homeViewController.homeHighlights),
                        _ => const SizedBox.shrink()
                      },
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                        valueListenable: homeViewController.homeOffersState,
                        builder: (context, state, _) => switch (state) {
                              BasicStateView.loading => const HomeOffersMainCarouselShimmer(),
                              BasicStateView.success => OffersMainCarousel(offers: homeViewController.homeOffers),
                              _ => const SizedBox.shrink()
                            }),
                    const SizedBox(height: 25),
                    ValueListenableBuilder(
                        valueListenable: homeViewController.foodKindsState,
                        builder: (context, state, _) => switch (state) {
                              BasicStateView.loading => const ShopByCategorySessionShimmer(),
                              BasicStateView.success => const AnimatedShopByCategorySession(),
                              _ => const SizedBox.shrink()
                            }),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: homeViewController.homeProductSessionsState,
                      builder: (context, state, _) => switch (state) {
                        BasicStateView.loading => const HomeProductsGridSessionShimmer(),
                        BasicStateView.success => Column(
                            children: homeViewController.homeProductSessions
                                .map((session) => HomeProductsGridSession(session: session))
                                .toList(),
                          ),
                        _ => const SizedBox.shrink()
                      },
                    ),
                    SizedBox(height: UIScale.height(15) + UIScale.bottomDevicePadding),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
