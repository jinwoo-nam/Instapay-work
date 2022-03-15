import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentMethodWidget extends StatelessWidget {
  final BankAccountData data;

  const PaymentMethodWidget({
    Key? key,
    required this.data,
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
      child: Container(
        color: color.lightGrey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  state.isSelectedDelete == true
                      ? (data.title == 'INC')
                          ?
                  Image.asset(
                    'imgs/wallet-instacoin@2x.png',
                    width: 20,
                    height: 20,
                  )
                      : (state.deleteSelectAccount != data)
                          ? Image.asset(
                              'imgs/select-empty@2x.png',
                              width: 15,
                              height: 15,
                            )
                          : Image.asset(
                              'imgs/select-filled@2x.png',
                              width: 15,
                              height: 15,
                            )
                  : (data.title == 'INC')
                      ? Image.asset(
                          'imgs/wallet-instacoin@2x.png',
                          width: 20,
                          height: 20,
                        )
                      : Image.asset(
                          'imgs/wallet-bankaccount@2x.png',
                          width: 20,
                          height: 20,
                        )
                  ,
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
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
                    viewModel.setDefaultAccount(data);
                  },
                ),
              ),
            ],
          ),
        ),
        //trailing:
      ),
    );
  }
}
