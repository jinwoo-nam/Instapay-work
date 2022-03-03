import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/history_search_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_screen.dart';
import 'package:instapay_clone/presentation/qr_pay/qr_pay_screen.dart';
import 'package:instapay_clone/presentation/setting/setting_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();
    final _children = [
      const QrPayScreen(),
      const MyWalletScreen(),
      const HistorySearchScreen(),
      const SettingScreen(),
    ];
    return SafeArea(
        child: _children[viewModel.curIndex],
      );
  }
}
