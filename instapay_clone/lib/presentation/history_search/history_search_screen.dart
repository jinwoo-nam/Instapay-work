import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/components/bottom_menu.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/bill_box_screen.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/monthly_screen.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/recently_screen.dart';
import 'package:instapay_clone/responsive/responsive.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:instapay_clone/ui/tab_menu.dart';

class HistorySearchScreen extends StatelessWidget {
  const HistorySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: '최근',
              ),
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
            if (Responsive.isMobile(context))
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomMenu(
                  type: TabMenuType.HistorySearch,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
