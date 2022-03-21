import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/components/side_menu.dart';
import 'package:instapay_clone/presentation/history_search/history_search_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_screen_2.dart';
import 'package:instapay_clone/responsive/responsive.dart';
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
      const MyWalletScreen2(),
      const HistorySearchScreen(),
      const SettingScreen(),
    ];
    return SafeArea(
      child: Row(
        children: [
          if (!Responsive.isMobile(context))
            const Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: _children[viewModel.curIndex],
          ),
        ],
      ),
    );
  }
}
