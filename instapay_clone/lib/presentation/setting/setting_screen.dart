import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: false,
        backgroundColor: Colors.indigo,
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
                  primary: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Align(
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
    );
  }
}
