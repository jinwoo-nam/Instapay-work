import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/bank_account_data.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentMethodWidget extends StatefulWidget {
  final BankAccountData data;

  const PaymentMethodWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyWalletViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minLeadingWidth: 0,
        tileColor: color.lightGrey,
        title: Row(
          children: [
            state.isSelectedDelete == true
                ? IconButton(
                    onPressed: null,
                    icon: widget.data.title == 'INC'
                        ? Image.asset(
                            'imgs/wallet-instacoin@2x.png',
                            width: 20,
                            height: 20,
                          )
                        : (state.deleteSelectAccount != widget.data)
                            ? Image.asset(
                                'imgs/select-empty@2x.png',
                                width: 15,
                                height: 15,
                              )
                            : Image.asset(
                                'imgs/select-filled@2x.png',
                                width: 15,
                                height: 15,
                              ),
                  )
                : IconButton(
                    onPressed: null,
                    icon: widget.data.title == 'INC'
                        ? Image.asset(
                            'imgs/wallet-instacoin@2x.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'imgs/wallet-bankaccount@2x.png',
                            width: 20,
                            height: 20,
                          ),
                  ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.data.title),
                (widget.data.accountNumber.trim().isEmpty)
                    ? Text('${widget.data.balance} ${widget.data.unit}')
                    : Text(widget.data.accountNumber),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: widget.data.title == 'INC'
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
          onPressed: () {},
        ),
      ),
    );
  }
}
