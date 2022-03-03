import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/main_page/main_screen_view_model.dart';
import 'package:instapay_clone/presentation/my_wallet/components/payment_method.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:provider/provider.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainScreenViewModel>();
    final viewModel = context.watch<MyWalletViewModel>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.indigo,
        title: Text(
          viewModel.isSelectedDelete == false ? '내 지갑' : '삭제 선택',
          style: const TextStyle(fontSize: 25),
        ),
        actions: [
          viewModel.isSelectedDelete == false
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    viewModel.onDeleteButtonClick();
                  },
                  icon: const Icon(
                    Icons.highlight_off_outlined,
                    size: 30,
                  ),
                ),
          IconButton(
            onPressed: () {
              viewModel.isSelectedDelete == false
                  ? viewModel.onDeleteButtonClick()
                  : viewModel.deletePaymentMethod();
            },
            icon: const Icon(
              Icons.delete,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              PaymentMethod(
                title: 'INC',
                balance: 0,
                unit: '',
              ),
              PaymentMethod(
                title: 'Deposit',
                balance: 0,
                unit: 'KRW',
              ),
              PaymentMethod(
                title: 'Ethereum',
                balance: 0,
                unit: 'ETH',
              ),
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
    );
  }
}
