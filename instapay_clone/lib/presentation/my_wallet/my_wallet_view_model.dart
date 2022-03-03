import 'package:flutter/material.dart';

class MyWalletViewModel with ChangeNotifier {
  bool _isSelectedDelete = false;
  bool get isSelectedDelete => _isSelectedDelete;

  void onDeleteButtonClick(){
    _isSelectedDelete = !_isSelectedDelete;
    notifyListeners();
  }

  void deletePaymentMethod(){

  }
}
