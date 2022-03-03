import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/history_search_screen.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_screen.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_screen.dart';
import 'package:instapay_clone/presentation/setting/setting_screen.dart';

class MainScreenViewModel with ChangeNotifier {

  int _curIndex = 0;
  int get curIndex => _curIndex;

  final _children = [
    QrPayScreen(),
    MyWalletScreen(),
    HistorySearchScreen(),
    SettingScreen(),
  ];

  get children => _children;

  void onBottomNavTap(int index) {
    _curIndex = index;
    notifyListeners();
  }

}