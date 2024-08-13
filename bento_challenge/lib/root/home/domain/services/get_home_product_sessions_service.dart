import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/entities/home_products_session_entity.dart';
import 'package:dartz/dartz.dart';

class GetHomeProductSessionsService {
  final IHomeRepository _homeRepository;

  GetHomeProductSessionsService(this._homeRepository);

  Future<Either<CoreFailure, List<HomeProductsSessionEntity>>> call() async {
    return await _homeRepository.getHomeProductSessions();
  }
}
