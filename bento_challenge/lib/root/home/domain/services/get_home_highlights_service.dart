import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/entities/home_highlight_entity.dart';
import 'package:dartz/dartz.dart';

class GetHomeHighlightsService {
  final IHomeRepository _homeRepository;

  GetHomeHighlightsService(this._homeRepository);

  Future<Either<CoreFailure, List<HomeHighlightEntity>>> call() async {
    return await _homeRepository.getHomeHighlights();
  }
}
