import 'package:flutter/material.dart';

class MyBottomNavBarController extends ChangeNotifier {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  ValueNotifier<int> get currentIndex => _currentIndex;

  void updateCurrentIndex(int index) {
    _currentIndex.value = index;
    _currentIndex.notifyListeners();
  }
}
