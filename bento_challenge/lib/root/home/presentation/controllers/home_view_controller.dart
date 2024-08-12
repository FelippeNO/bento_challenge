import 'package:flutter/foundation.dart';

class HomeViewController extends ChangeNotifier {
  List<String> cities = [
    'Bacangan, Sambit',
    'Eostolia, Rizo',
    'Keloa, Fuchi',
    'Modesto, Linya',
  ];

  ValueNotifier<String> selectedCity = ValueNotifier('Bacangan, Sambit');

  void setSelectedCity(String city) {
    selectedCity.value = city;
    selectedCity.notifyListeners();
  }

  init() async {}
}
