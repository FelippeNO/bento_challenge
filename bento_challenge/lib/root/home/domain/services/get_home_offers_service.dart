import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/entities/home_offer_entity.dart';
import 'package:dartz/dartz.dart';

class GetHomeOffersService {
  final IHomeRepository _homeRepository;

  GetHomeOffersService(this._homeRepository);

  Future<Either<CoreFailure, List<HomeOfferEntity>>> call() async {
    return await _homeRepository.getHomeOffers();
  }
}
