import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:instapay_clone/data/data_source/history_search/get_payment_history_data_source.dart';
import 'package:instapay_clone/data/repository/history_search/get_payment_history_repository_impl.dart';
import 'package:instapay_clone/domain/use_case/history_search/get_payment_history_use_case.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/period_screen.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/monthly_screen.dart';
import 'package:instapay_clone/presentation/history_search/detail_page/recently_screen.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class HistorySearchScreen extends StatelessWidget {
  const HistorySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();

    return ChangeNotifierProvider(
      create: (_) => HistorySearchViewModel(
        getPaymentHistoryUseCase: GetPaymentHistoryUseCase(
            GetPaymentHistoryRepositoryImpl(
                GetPaymentHistoryDataSource(client: http.Client()))),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: false,
            backgroundColor: Colors.white,
            title: const Text(
              '내역 조회',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
            bottom: TabBar(
              labelColor: color.key,
              unselectedLabelColor: Colors.black,
              indicator: const UnderlineTabIndicator(
                borderSide:
                    BorderSide(width: 5.0, color: color.key),
              ),
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              onTap: (value) {
                FocusScope.of(context).unfocus();
              },
              tabs: const [
                Tab(
                  text: '최근',
                ),
                Tab(text: '월별'),
                Tab(text: '기간'),
              ],
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                const TabBarView(
                  children: [
                    RecentlyScreen(),
                    MonthlyScreen(),
                    PeriodScreen(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavigationBar(
                    currentIndex: mainViewModel.curIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: mainViewModel.onBottomNavTap,
                    selectedItemColor: color.key,
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
                            color: color.key,
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
        ),
      ),
    );
  }
}
