import 'package:flutter/material.dart';

class OrderLoader {
  static final OrderLoader appLoader = OrderLoader();
  ValueNotifier<bool> loaderShowingNotifier = ValueNotifier(false);
  ValueNotifier<String> loaderTextNotifier = ValueNotifier('error message');

  void showLoader() {
    loaderShowingNotifier.value = true;
  }

  void hideLoader() {
    loaderShowingNotifier.value = false;
  }
}
