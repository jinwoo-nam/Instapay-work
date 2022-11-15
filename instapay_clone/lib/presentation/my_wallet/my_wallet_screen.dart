import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/components/bank_account_register_screen.dart';
import 'package:instapay_clone/presentation/my_wallet/components/insta_card_widget.dart';
import 'package:instapay_clone/presentation/my_wallet/components/payment_method_widget.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../ui/color.dart' as color;

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  StreamSubscription? _streamSubscription;
  late FToast fToast;
  late Widget toast;

  _removeToast() {
    fToast.removeCustomToast();
  }

  _showToast(String message) {
    _removeToast();

    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
      child: Column(
        children: [
          Container(
            width: 350,
            height: 50,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Color(0xff3C4A55),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _showChangeDefaultAccountToast(String message) {
    _removeToast();

    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
      child: Column(
        children: [
          Container(
            width: 350,
            height: 50,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Color(0xff3C4A55),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: '기본 결제 수단이 ',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: message,
                        style: const TextStyle(
                          color: Color(0xff4BC1C2),
                        ),
                      ),
                      const TextSpan(
                        text: '으로 설정되었습니다.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          fToast = FToast();
          fToast.init(context);
        },
      );

      final viewModel = context.read<MyWalletViewModel>();
      viewModel.fetchBankAccountData();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          showSnackBar: (message) {
            _showToast(message);
          },
          changeDefaultAccount: (message) {
            _showChangeDefaultAccountToast(message);
          },
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('imgs/wallet-instacoin@2x.png'), context);
    precacheImage(const AssetImage('imgs/wallet-starempty@2x.png'), context);
    precacheImage(const AssetImage('imgs/wallet-bankaccount@2x.png'), context);
    precacheImage(const AssetImage('imgs/wallet-starfilled@2x.png'), context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<MyWalletViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        title: Text(
          state.isSelectedDelete == false ? '내 지갑' : '삭제 선택',
          style: const TextStyle(fontSize: 25, color: Colors.black),
        ),
        actions: [
          state.isSelectedDelete == false
              ? IconButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BankAccountRegisterScreen(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'imgs/wallet-plus@2x.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    viewModel.onDeleteButtonClick();
                  },
                  icon: Image.asset(
                    'imgs/exit_x@2x.png',
                    color: Colors.black,
                    width: 20,
                    height: 20,
                  ),
                ),
          IconButton(
            onPressed: () {
              if (state.isSelectedDelete == false) {
                viewModel.onDeleteButtonClick();
              } else {
                if (state.deleteSelectAccount != null) {
                  viewModel.deleteBankAccountData(state.deleteSelectAccount!);
                }
              }
            },
            icon: Image.asset(
              'imgs/wallet-trash@2x.png',
              color: Colors.black,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: InstaCardWidget(
                    deposit: 110000,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 16.0),
                  child: Column(
                    children: [
                      ...state.meansDataList
                          .map(
                            (e) => GestureDetector(
                              onTap: state.isSelectedDelete == true
                                  ? () {
                                      viewModel
                                          .setDeleteSelectedBankAccountData(e);
                                    }
                                  : () {},
                              child: PaymentMethodWidget(
                                data: e,
                                isAccountNull:
                                    (state.meansDataList.length <= 1),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
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
                  label: ('QR 결제'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'imgs/tab-wallet@2x.png',
                    color: color.key,
                    width: 20,
                    height: 20,
                  ),
                  label: ('내 지갑'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'imgs/tab-search@2x.png',
                    width: 20,
                    height: 20,
                  ),
                  label: ('내역 조회'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'imgs/tab-setting@2x.png',
                    width: 20,
                    height: 20,
                  ),
                  label: ('설정'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
