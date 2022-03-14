import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/components/bill_box_screen.dart';
import 'package:instapay_clone/presentation/history_search/components/monthly_screen.dart';
import 'package:instapay_clone/presentation/history_search/components/recently_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class HistorySearchScreen extends StatelessWidget {
  const HistorySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: false,
          backgroundColor: color.mainNavy,
          title: const Text('내역 조회'),
          bottom: const TabBar(
            labelColor: color.mainSelectColor,
            unselectedLabelColor: Colors.white,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: color.mainSelectColor),
            ),
            labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: '최근',),
              Tab(text: '월별'),
              Tab(text: '청구서함'),
            ],
          ),
        ),
        body: Stack(
          children: [
            const TabBarView(
              children: [
                RecentlyScreen(),
                MonthlyScreen(),
                BillBoxScreen(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
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
                      ),
                      label: ('QR 결제')),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'imgs/tab-wallet@2x.png',
                        width: 20,
                        height: 20,
                      ),
                      label: ('내 지갑')),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'imgs/tab-search@2x.png',
                        color: color.mainSelectColor,
                        width: 20,
                        height: 20,
                      ),
                      label: ('내역 조회')),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'imgs/tab-setting@2x.png',
                        width: 20,
                        height: 20,
                      ),
                      label: ('설정')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
