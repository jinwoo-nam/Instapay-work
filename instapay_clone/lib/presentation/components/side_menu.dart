import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/ui/color.dart';
import 'package:instapay_clone/ui/tab_menu.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('imgs/home-logo@2x.png'),
          ),
          const DrawerListTile(
            title: 'QR 결제',
            imgSrc: 'imgs/tab-qr@2x.png',
            type: TabMenuType.QrPay,
          ),
          const DrawerListTile(
            title: '내 지갑',
            imgSrc: 'imgs/tab-wallet@2x.png',
            type: TabMenuType.MyWallet,
          ),
          const DrawerListTile(
            title: '결제 내역',
            imgSrc: 'imgs/tab-search@2x.png',
            type: TabMenuType.HistorySearch,
          ),
          const DrawerListTile(
            title: '설정',
            imgSrc: 'imgs/tab-setting@2x.png',
            type: TabMenuType.Setting,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.imgSrc,
    required this.type,
  }) : super(key: key);

  final String title, imgSrc;
  final TabMenuType type;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainScreenViewModel>();

    return ListTile(
      onTap: () {
        viewModel.onBottomNavTap(type.index);
      },
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        imgSrc,
        color:
            viewModel.curIndex == type.index ? mainSelectColor : Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: viewModel.curIndex == type.index
              ? mainSelectColor
              : Colors.white54,
        ),
      ),
    );
  }
}
