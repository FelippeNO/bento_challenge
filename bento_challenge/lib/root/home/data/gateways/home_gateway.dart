import 'package:bento_challenge/core/clients/core_mocked_client.dart';
import 'package:bento_challenge/core/utils/gateway_handler.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:bento_challenge/root/home/error/exceptions.dart';

abstract class IHomeGateway {
  Future<List<FoodKindEntity>> getFoodKinds();
  Future<List<HomeHighlightEntity>> getHomeHighlights();
  Future<List<HomeOfferEntity>> getHomeOffers();
  Future<List<HomeProductsSessionEntity>> getHomeProductSessions();
}

class HomeGateway extends GatewayHandler implements IHomeGateway {
  final IMockedClient _client;

  HomeGateway(this._client);

  @override
  Future<List<FoodKindEntity>> getFoodKinds() async {
    return call(
      requisitionCallback: () => _client.get('/home/food_kinds'),
      onSuccessCallback: (data) => List<FoodKindEntity>.from(data.map((x) => FoodKindEntity.fromJson(x))),
      exception: GetFoodKindsException(),
    );
  }

  @override
  Future<List<HomeHighlightEntity>> getHomeHighlights() async {
    return call(
      requisitionCallback: () => _client.get('/home/highlights'),
      onSuccessCallback: (data) => List<HomeHighlightEntity>.from(data.map((x) => HomeHighlightEntity.fromJson(x))),
      exception: GetHomeHighlightsException(),
    );
  }

  @override
  Future<List<HomeOfferEntity>> getHomeOffers() async {
    return call(
      requisitionCallback: () => _client.get('/home/offers'),
      onSuccessCallback: (data) => List<HomeOfferEntity>.from(data.map((x) => HomeOfferEntity.fromJson(x))),
      exception: GetHomeOffersException(),
    );
  }

  @override
  Future<List<HomeProductsSessionEntity>> getHomeProductSessions() async {
    return call(
      requisitionCallback: () => _client.get('/home/product_sessions'),
      onSuccessCallback: (data) =>
          List<HomeProductsSessionEntity>.from(data.map((x) => HomeProductsSessionEntity.fromJson(x))),
      exception: GetHomeProductSessionsException(),
    );
  }
}
