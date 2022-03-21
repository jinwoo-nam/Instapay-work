import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/components/bottom_menu.dart';
import 'package:instapay_clone/presentation/my_wallet/components/bank_account_register_screen.dart';
import 'package:instapay_clone/presentation/my_wallet/components/payment_method_widget.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/responsive/responsive.dart';
import 'package:instapay_clone/ui/tab_menu.dart';
import 'package:provider/provider.dart';

import '../../ui/color.dart' as color;

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
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
                      viewModel.setDefaultAccount(result);
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
                            : () {},
                        child: PaymentMethodWidget(
                          data: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          if (Responsive.isMobile(context))
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomMenu(
                type: TabMenuType.MyWallet,
              ),
            ),
        ],
      ),
    );
  }
}
