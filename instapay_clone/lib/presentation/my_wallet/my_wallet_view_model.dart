import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';

class MyWalletViewModel with ChangeNotifier {
  MyWalletState _state = MyWalletState();

  MyWalletState get state => _state;

  void onDeleteButtonClick() {
    _state = state.copyWith(isSelectedDelete: state.isSelectedDelete);
    notifyListeners();
  }

  void deletePaymentMethod() {}
}
