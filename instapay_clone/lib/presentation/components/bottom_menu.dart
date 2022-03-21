import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/ui/tab_menu.dart';
import 'package:provider/provider.dart';
import 'package:instapay_clone/ui/color.dart' as color;

class BottomMenu extends StatelessWidget {
  final TabMenuType type;

  const BottomMenu({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();

    return BottomNavigationBar(
      currentIndex: mainViewModel.curIndex,
      type: BottomNavigationBarType.fixed,
      onTap: mainViewModel.onBottomNavTap,
      selectedItemColor: color.mainSelectColor,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'imgs/tab-qr@2x.png',
              width: 20,
              height: 20,
              color: type == TabMenuType.QrPay
                  ? color.mainSelectColor
                  : Colors.white,
            ),
            label: ('QR 결제')),
        BottomNavigationBarItem(
            icon: Image.asset(
              'imgs/tab-wallet@2x.png',
              width: 20,
              height: 20,
              color: type == TabMenuType.MyWallet
                  ? color.mainSelectColor
                  : Colors.white,
            ),
            label: ('내 지갑')),
        BottomNavigationBarItem(
            icon: Image.asset(
              'imgs/tab-search@2x.png',
              width: 20,
              height: 20,
              color: type == TabMenuType.HistorySearch
                  ? color.mainSelectColor
                  : Colors.white,
            ),
            label: ('내역 조회')),
        BottomNavigationBarItem(
            icon: Image.asset(
              'imgs/tab-setting@2x.png',
              width: 20,
              height: 20,
              color: type == TabMenuType.Setting
                  ? color.mainSelectColor
                  : Colors.white,
            ),
            label: ('설정')),
      ],
    );
  }
}


