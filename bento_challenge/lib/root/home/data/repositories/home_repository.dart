import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/core/utils/repository_handler.dart';
import 'package:bento_challenge/root/home/data/gateways/home_gateway.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:bento_challenge/root/home/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IHomeRepository {
  Future<Either<CoreFailure, List<FoodKindEntity>>> getFoodKinds();
  Future<Either<CoreFailure, List<HomeHighlightEntity>>> getHomeHighlights();
  Future<Either<CoreFailure, List<HomeOfferEntity>>> getHomeOffers();
  Future<Either<CoreFailure, List<HomeProductsSessionEntity>>> getHomeProductSessions();
}

class HomeRepository extends RepositoryHandler implements IHomeRepository {
  final IHomeGateway _gateway;

  HomeRepository(this._gateway);

  @override
  Future<Either<CoreFailure, List<FoodKindEntity>>> getFoodKinds() async {
    return call(
      gatewayCallback: () => _gateway.getFoodKinds(),
      failure: GetFoodKindsFailure(),
    );
  }

  @override
  Future<Either<CoreFailure, List<HomeHighlightEntity>>> getHomeHighlights() async {
    return call(
      gatewayCallback: () => _gateway.getHomeHighlights(),
      failure: GetHomeHighlightsFailure(),
    );
  }

  @override
  Future<Either<CoreFailure, List<HomeOfferEntity>>> getHomeOffers() async {
    return call(
      gatewayCallback: () => _gateway.getHomeOffers(),
      failure: GetHomeOffersFailure(),
    );
  }

  @override
  Future<Either<CoreFailure, List<HomeProductsSessionEntity>>> getHomeProductSessions() async {
    return call(
      gatewayCallback: () => _gateway.getHomeProductSessions(),
      failure: GetHomeProductSessionsFailure(),
    );
  }
}
