import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/setting/components/setting_list_widget.dart';
import 'package:instapay_clone/presentation/setting/setting_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final String _url =
      'https://www.instapay.kr/10x10.php?t=d20cx-mc22m-03u10-09z58-a22av&q=f9ac81ca0da1c62e1308d8520ae21b5b42cf1ccb';

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState() {
    final viewModel = context.read<SettingViewModel>();
    viewModel.getJuso();
    viewModel.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<SettingViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.userEmail,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    state.userName,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Image.asset(
                  'imgs/event_alert@2x.png',
                  width: 75,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...state.settingList
                    .map((e) => SettingListWidget(data: e))
                    .toList(),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
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
                      width: 20,
                      height: 20,
                    ),
                    label: ('내역 조회')),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'imgs/tab-setting@2x.png',
                      color: color.key,
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
