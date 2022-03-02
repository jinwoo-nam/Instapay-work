import 'package:flutter/material.dart';

class RootViewModel with ChangeNotifier {
  RootViewModel();

  bool isSignIn = false;

  void setSignInResult(bool res) {
    isSignIn = res;
    notifyListeners();
  }
}
