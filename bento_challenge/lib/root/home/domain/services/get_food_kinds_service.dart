import 'package:bento_challenge/core/error/core_failure.dart';
import 'package:bento_challenge/root/home/data/repositories/home_repository.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:dartz/dartz.dart';

class GetFoodKindsService {
  final IHomeRepository _homeRepository;

  GetFoodKindsService(this._homeRepository);

  Future<Either<CoreFailure, List<FoodKindEntity>>> call() async {
    return await _homeRepository.getFoodKinds();
  }
}
