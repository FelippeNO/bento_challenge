import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/services/get_food_kinds_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_highlights_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_offers_service.dart';
import 'package:bento_challenge/root/home/domain/services/get_home_product_sessions_service.dart';
import 'package:flutter/foundation.dart';

class HomeViewController extends ChangeNotifier {
  final GetFoodKindsService _getFoodKindsService;
  final GetHomeHighlightsService _getHomeHighlightsService;
  final GetHomeOffersService _getHomeOffersService;
  final GetHomeProductSessionsService _getHomeProductSessionsService;

  HomeViewController(
    this._getFoodKindsService,
    this._getHomeHighlightsService,
    this._getHomeOffersService,
    this._getHomeProductSessionsService,
  );

  List<String> cities = [
    'Bacangan, Sambit',
    'Eostolia, Rizo',
    'Keloa, Fuchi',
    'Modesto, Linya',
  ];
  ValueNotifier<String> selectedCity = ValueNotifier('Bacangan, Sambit');
  ValueNotifier<int> selectedFoodKindId = ValueNotifier(1);
  ValueNotifier<bool> isGettinKinds = ValueNotifier(false);
  List<FoodKindEntity> foodKinds = [];
  final ValueNotifier<List<int>> _productInCartIds = ValueNotifier([]);

  ValueNotifier<List<int>> get productInCartIds => _productInCartIds;

  void setSelectedCity(String city) {
    selectedCity.value = city;
    selectedCity.notifyListeners();
  }

  init() async {
    Future.wait([
      _getFoodKinds(),
      _getHomeHighlights(),
      _getHomeOffers(),
      _getHomeProductSessions(),
    ]);

    final data = foodKindData['kinds'] as List<Map<String, dynamic>>;

    for (var item in data) {
      foodKinds.add(FoodKindEntity.fromJson(item));
    }

    selectedFoodKindId.value = foodKinds.first.id;
    selectedFoodKindId.notifyListeners();
  }

  Future _getFoodKinds() async {
    final result = await _getFoodKindsService.call();
    result.fold(
      (failure) => print('Error: $failure'),
      (data) {},
    );
  }

  Future _getHomeHighlights() async {
    final result = await _getHomeHighlightsService.call();
    result.fold(
      (failure) => print('Error: $failure'),
      (data) {},
    );
  }

  Future _getHomeOffers() async {
    final result = await _getHomeOffersService.call();
    result.fold(
      (failure) => print('Error: $failure'),
      (data) {},
    );
  }

  Future _getHomeProductSessions() async {
    final result = await _getHomeProductSessionsService.call();
    result.fold(
      (failure) => print('Error: $failure'),
      (data) {},
    );
  }

  addOrRemoveProductFromCart(int productId) {
    if (_productInCartIds.value.contains(productId)) {
      _productInCartIds.value.remove(productId);
    } else {
      _productInCartIds.value.add(productId);
    }
    _productInCartIds.notifyListeners();
  }
}
