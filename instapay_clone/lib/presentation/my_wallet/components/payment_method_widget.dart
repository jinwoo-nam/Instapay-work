import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentMethodWidget extends StatelessWidget {
  final BankAccountData data;
  final bool isAccountNull;

  const PaymentMethodWidget({
    Key? key,
    required this.data,
    required this.isAccountNull,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyWalletViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color.lightGrey,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      buildIcon(state),
                      buildMainTitle(),
                    ],
                  ),
                  IconButton(
                    icon: state.defaultAccount == data
                        ? Image.asset(
                            'imgs/wallet-starfilled@2x.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'imgs/wallet-starempty@2x.png',
                            width: 20,
                            height: 20,
                          ),
                    onPressed: () {
                      if (!state.isSelectedDelete) {
                        viewModel.setDefaultAccount(data);
                      }
                    },
                  ),
                ],
              ),
            ),
            //trailing:
          ),
          if (isAccountNull)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: DottedBorder(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 20,
                ),
                color: color.lightGrey,
                //color of dotted/dash line
                strokeWidth: 2,
                //thickness of dash/dots
                dashPattern: const [10, 6],
                radius: Radius.circular(20),
                borderType: BorderType.RRect,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '본인 명의의 은행계좌를 등록해주세요.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildMainTitle() {
    if (data.title == '인스타코인') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color.mainNavy,
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            (data.accountNumber.trim().isEmpty)
                ? Text('${data.balance} ${data.unit}')
                : Text(data.accountNumber),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color.mainNavy,
              ),
            ),
            (data.accountNumber.trim().isEmpty)
                ? Text('${data.balance} ${data.unit}')
                : Text(data.accountNumber),
          ],
        ),
      );
    }
  }

  Widget buildIcon(MyWalletState state) {
    if (state.isSelectedDelete == true && data.title != '인스타코인') {
      if (state.deleteSelectAccount != data) {
        return Image.asset(
          'imgs/select-empty@2x.png',
          width: 15,
          height: 15,
        );
      } else {
        return Image.asset(
          'imgs/select-filled@2x.png',
          width: 15,
          height: 15,
        );
      }
    } else if (data.title == '인스타코인') {
      return Image.asset(
        'imgs/wallet-instacoin@2x.png',
        width: 20,
        height: 20,
      );
    } else {
      return Image.asset(
        'imgs/wallet-bankaccount@2x.png',
        width: 20,
        height: 20,
      );
    }
  }
}
