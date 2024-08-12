import 'package:flutter/material.dart';

class MyBottomNavBarController extends ChangeNotifier {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  ValueNotifier<int> get currentIndex => _currentIndex;
  ValueNotifier<bool> get isVisible => _isVisible;
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  void updateCurrentIndex(int index) {
    _currentIndex.value = index;
    _currentIndex.notifyListeners();
  }

  changeVisibility({bool? to}) {
    if (to != null) {
      _isVisible.value = to;
      _isVisible.notifyListeners();
      return;
    }

    _isVisible.value = !_isVisible.value;
    _isVisible.notifyListeners();
  }
}
