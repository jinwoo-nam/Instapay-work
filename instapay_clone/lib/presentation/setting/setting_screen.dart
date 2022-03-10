import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/setting/components/list_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<SettingViewModel>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: false,
        backgroundColor: color.mainNavy,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'njw9108@instapay.kr',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '남진우',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              width: 90,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Event'),
                style: ElevatedButton.styleFrom(
                  primary: color.mainSelectColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children:
                viewModel.settingList.map((e) => ListWidget(data: e)).toList(),
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
                      width: 20,
                      height: 20,
                    ),
                    label: ('내역 조회')),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'imgs/tab-setting@2x.png',
                      color: color.mainSelectColor,
                      width: 20,
                      height: 20,
                    ),
                    label: ('설정')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
