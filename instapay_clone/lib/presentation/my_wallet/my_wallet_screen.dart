import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();

    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
        currentIndex: mainViewModel.curIndex,
        type: BottomNavigationBarType.fixed,
        onTap: mainViewModel.onBottomNavTap,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code,
              ),
              label: ('QR 결제')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_travel,
              ),
              label: ('내 지갑')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: ('내역 조회')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: ('설정')),
        ],
      ),
    );
  }
}
