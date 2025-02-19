import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  int currentIndex = 0;

  updateIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
