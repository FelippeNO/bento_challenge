import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/root/home/data/gateways/home_gateway.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/services/get_food_kinds_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_highlights_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_offers_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_product_sessions_service.dart';
import 'package:bento_challenge/root/home/presentation/controllers/home_view_controller.dart';
import 'package:bento_challenge/root/navbar/controller/my_bottom_nav_controller.dart';
import 'package:bento_challenge/root/presentation/views/root_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<IMockedClient>(CoreMockedClient.new);
    i.addSingleton<MyBottomNavBarController>(MyBottomNavBarController.new);

    //home
    i.addSingleton<IHomeGateway>(HomeGateway.new);
    i.addSingleton<IHomeRepository>(HomeRepository.new);
    i.addSingleton<GetFoodKindsService>(GetFoodKindsService.new);
    i.addSingleton<GetHomeHighlightsService>(GetHomeHighlightsService.new);
    i.addSingleton<GetHomeOffersService>(GetHomeOffersService.new);
    i.addSingleton<GetHomeProductSessionsService>(GetHomeProductSessionsService.new);
    i.addSingleton<HomeViewController>(HomeViewController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => RootView(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 800),
    );
  }
}
