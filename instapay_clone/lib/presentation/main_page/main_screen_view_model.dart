import 'package:flutter/material.dart';


class MainScreenViewModel with ChangeNotifier {

  int _curIndex = 0;
  int get curIndex => _curIndex;

  void onBottomNavTap(int index) {
    _curIndex = index;
    notifyListeners();
  }

}