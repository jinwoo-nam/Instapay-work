import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/components/bank_account_register_screen.dart';
import 'package:instapay_clone/presentation/my_wallet/components/payment_method_widget.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:provider/provider.dart';

import '../../ui/color.dart' as color;

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<MyWalletViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: color.mainNavy,
        title: Text(
          state.isSelectedDelete == false ? '내 지갑' : '삭제 선택',
          style: const TextStyle(fontSize: 25),
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
                    if (result != null) {
                      viewModel.addBankAccountData(result);
                    }
                  },
                  icon: Image.asset(
                    'imgs/wallet-plus@2x.png',
                    color: Colors.white,
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
                    color: Colors.white,
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
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
            child: ListView(
              children: [
                ...state.accountList
                    .map(
                      (e) => GestureDetector(
                        onTap: state.isSelectedDelete == true
                            ? () {
                                viewModel.setDeleteSelectedBankAccountData(e);
                              }
                            : null,
                        child: PaymentMethodWidget(
                          data: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
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
                  label: ('QR 결제'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'imgs/tab-wallet@2x.png',
                    color: color.mainSelectColor,
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
