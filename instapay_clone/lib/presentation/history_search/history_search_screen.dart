import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/components/bill_box_screen.dart';
import 'package:instapay_clone/presentation/history_search/components/monthly_screen.dart';
import 'package:instapay_clone/presentation/history_search/components/recently_screen.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
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
          backgroundColor: Colors.indigo,
          title: const Text('내역 조회'),
          bottom: TabBar(
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.white,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: Colors.teal),
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
            TabBarView(
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
            ),
          ],
        ),
      ),
    );
  }
}
