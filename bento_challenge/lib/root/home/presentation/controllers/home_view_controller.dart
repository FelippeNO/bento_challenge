import 'package:bento_challenge/core/enums/basic_state_view.dart';
import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
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

  //declaration
  final ValueNotifier<List<int>> _productInCartIds = ValueNotifier([]);
  final ValueNotifier<BasicStateView> _homeProductSessionsState = ValueNotifier(BasicStateView.loading);
  final ValueNotifier<BasicStateView> _foodKindsState = ValueNotifier(BasicStateView.loading);
  final ValueNotifier<BasicStateView> _homeHighlightsState = ValueNotifier(BasicStateView.loading);
  final ValueNotifier<BasicStateView> _homeOffersState = ValueNotifier(BasicStateView.loading);
  final List<FoodKindEntity> _foodKinds = [];
  final List<HomeHighlightEntity> _homeHighlights = [];
  final List<HomeOfferEntity> _homeOffers = [];
  final List<HomeProductsSessionEntity> _homeProductSessions = [];

  //getters
  ValueNotifier<List<int>> get productInCartIds => _productInCartIds;
  ValueNotifier<BasicStateView> get foodKindsState => _foodKindsState;
  ValueNotifier<BasicStateView> get homeHighlightsState => _homeHighlightsState;
  ValueNotifier<BasicStateView> get homeOffersState => _homeOffersState;
  ValueNotifier<BasicStateView> get homeProductSessionsState => _homeProductSessionsState;
  List<FoodKindEntity> get foodKinds => _foodKinds;
  List<HomeHighlightEntity> get homeHighlights => _homeHighlights;
  List<HomeOfferEntity> get homeOffers => _homeOffers;
  List<HomeProductsSessionEntity> get homeProductSessions => _homeProductSessions;

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
    _foodKindsState.value = BasicStateView.loading;
    _foodKindsState.notifyListeners();
    final result = await _getFoodKindsService.call();
    result.fold(
      (failure) {
        debugPrint(failure.toString());
        _foodKindsState.value = BasicStateView.error;
        _foodKindsState.notifyListeners();
      },
      (data) {
        _foodKinds.clear();
        if (data.isEmpty) {
          _foodKindsState.value = BasicStateView.empty;
          _foodKindsState.notifyListeners();
          return;
        }

        _foodKinds.addAll(data);
        _foodKindsState.value = BasicStateView.success;
        _foodKindsState.notifyListeners();
      },
    );
  }

  Future _getHomeHighlights() async {
    _homeHighlightsState.value = BasicStateView.loading;
    _homeHighlightsState.notifyListeners();
    final result = await _getHomeHighlightsService.call();
    result.fold(
      (failure) {
        debugPrint(failure.toString());
        _homeHighlightsState.value = BasicStateView.error;
        _homeHighlightsState.notifyListeners();
      },
      (data) {
        _homeHighlights.clear();
        if (data.isEmpty) {
          _homeHighlightsState.value = BasicStateView.empty;
          _homeHighlightsState.notifyListeners();
          return;
        }
        _homeHighlights.addAll(data);
        _homeHighlightsState.value = BasicStateView.success;
        _homeHighlightsState.notifyListeners();
      },
    );
  }

  Future _getHomeOffers() async {
    _homeOffersState.value = BasicStateView.loading;
    _homeOffersState.notifyListeners();
    final result = await _getHomeOffersService.call();
    result.fold(
      (failure) {
        debugPrint(failure.toString());
        _homeOffersState.value = BasicStateView.error;
        _homeOffersState.notifyListeners();
      },
      (data) {
        _homeOffers.clear();
        if (data.isEmpty) {
          _homeOffersState.value = BasicStateView.empty;
          _homeOffersState.notifyListeners();
          return;
        }
        _homeOffers.addAll(data);
        _homeOffersState.value = BasicStateView.success;
        _homeOffersState.notifyListeners();
      },
    );
  }

  Future _getHomeProductSessions() async {
    _homeProductSessionsState.value = BasicStateView.loading;
    _homeProductSessionsState.notifyListeners();
    final result = await _getHomeProductSessionsService.call();
    result.fold(
      (failure) {
        debugPrint(failure.toString());
        _homeProductSessionsState.value = BasicStateView.error;
        _homeProductSessionsState.notifyListeners();
      },
      (data) {
        _homeProductSessions.clear();
        if (data.isEmpty) {
          _homeProductSessionsState.value = BasicStateView.empty;
          _homeProductSessionsState.notifyListeners();
          return;
        }
        _homeProductSessions.addAll(data);
        _homeProductSessionsState.value = BasicStateView.success;
        _homeProductSessionsState.notifyListeners();
      },
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
