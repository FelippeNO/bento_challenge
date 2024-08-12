import 'package:bento_challenge/root/home/data/food_kind_data.dart';
import 'package:bento_challenge/root/home/domain/entities/food_kind_entity.dart';
import 'package:flutter/foundation.dart';

class HomeViewController extends ChangeNotifier {
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

  void setSelectedCity(String city) {
    selectedCity.value = city;
    selectedCity.notifyListeners();
  }

  init() async {
    final data = foodKindData['kinds'] as List<Map<String, dynamic>>;

    for (var item in data) {
      foodKinds.add(FoodKindEntity.fromJson(item));
    }

    selectedFoodKindId.value = foodKinds.first.id;
    selectedFoodKindId.notifyListeners();
  }
}
