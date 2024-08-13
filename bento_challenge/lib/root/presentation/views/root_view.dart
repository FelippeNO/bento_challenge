import 'package:bento_challenge/core/design/ui_colors.dart';
import 'package:bento_challenge/core/design/ui_scale.dart';
import 'package:bento_challenge/product/presentation/views/product_details_view.dart';
import 'package:bento_challenge/root/home/presentation/views/home_view.dart';
import 'package:bento_challenge/root/navbar/bar.dart';
import 'package:bento_challenge/root/navbar/controller/my_bottom_nav_controller.dart';
import 'package:bento_challenge/root/navbar/item.dart';
import 'package:bento_challenge/root/presentation/views/account_view.dart';
import 'package:bento_challenge/root/presentation/views/cart_view.dart';
import 'package:bento_challenge/root/presentation/views/deals_view.dart';
import 'package:bento_challenge/root/presentation/views/market_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootView extends StatelessWidget {
  RootView({super.key});

  final List<Widget> _views = [
    const HomeView(),
    const DealsView(),
    const MarketView(),
    const CartView(),
    const AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: Modular.get<MyBottomNavBarController>().currentIndex,
            builder: (context, value, child) {
              return IndexedStack(
                index: value,
                children: _views,
              );
            },
          ),
          const AnimatedBottomBar(),
        ],
      ),
    );
  }
}

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({
    super.key,
  });

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Modular.get<MyBottomNavBarController>().isVisible,
        builder: (context, isVisible, _) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 1200),
            curve: const MyElasticOutCurve(1.5),
            bottom: isVisible ? 0 : -200,
            left: 0,
            right: 0,
            child: ConvexAppBar(
              backgroundColor: Colors.white,
              activeColor: UIColors.shamrock,
              color: UIColors.fringyFlower,
              style: TabStyle.fixedCircle,
              elevation: 5,
              height: 80,
              curveSize: 130,
              top: -60,
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.discount, title: 'Deals'),
                TabItem(icon: Icons.store, title: 'Market'),
                TabItem(icon: Icons.shopping_bag, title: 'Cart'),
                TabItem(icon: Icons.person, title: 'Account'),
              ],
              initialActiveIndex: 0,
              onTap: (int i) => {
                Modular.get<MyBottomNavBarController>().updateCurrentIndex(i),
              },
            ),
          );
        });
  }
}
