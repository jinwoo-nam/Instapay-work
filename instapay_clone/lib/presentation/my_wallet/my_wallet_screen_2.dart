import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/presentation/components/bottom_menu.dart';
import 'package:instapay_clone/presentation/my_wallet/components/bank_account_register_screen.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/responsive/responsive.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:data_table_2/data_table_2.dart';
import 'package:instapay_clone/ui/tab_menu.dart';
import 'package:provider/provider.dart';

class MyWalletScreen2 extends StatelessWidget {
  const MyWalletScreen2({Key? key}) : super(key: key);

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
          Container(
            padding: const EdgeInsets.all(color.defaultPadding),
            decoration: const BoxDecoration(
              color: color.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent Files",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: color.defaultPadding,
                    minWidth: 600,
                    columns: const [
                      DataColumn(
                        label: Text("이름"),
                      ),
                      DataColumn(
                        label: Text("계좌 번호"),
                      ),
                      DataColumn(
                        label: Text("잔액"),
                      ),
                      DataColumn(
                        label: Text("즐겨찾기"),
                      ),
                    ],
                    rows: List.generate(
                      state.accountList.length,
                          (index) => recentFileDataRow(state.accountList[index],state),
                    ),
                  ),
                ),
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

DataRow recentFileDataRow(BankAccountData accountInfo,MyWalletState state) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              'imgs/wallet-bankaccount@2x.png',
              width: 20,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: color.defaultPadding),
              child: Text(accountInfo.title),
            ),
          ],
        ),
      ),
      DataCell(Text(accountInfo.accountNumber)),
      DataCell(Text('${accountInfo.balance} ${accountInfo.unit}')),
      DataCell((state.deleteSelectAccount != accountInfo)
          ? Image.asset(
        'imgs/wallet-starempty@2x.png',
        width: 15,
        height: 15,
      )
          : Image.asset(
        'imgs/wallet-starfilled@2x.png',
        width: 15,
        height: 15,
      )),
    ],
  );
}
