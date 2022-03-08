import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  final String title;
  final double balance;
  final String unit;

  const PaymentMethod({
    Key? key,
    required this.title,
    required this.balance,
    required this.unit,
  }) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyWalletViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minLeadingWidth: 0,
        tileColor: color.lightGrey,
        title: Row(
          children: [
            viewModel.isSelectedDelete == true
                ? IconButton(
                    onPressed: () {

                    },
                    icon: widget.title == 'INC'
                        ? Image.asset(
                            'imgs/wallet-instacoin@2x.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'imgs/select-empty@2x.png',
                            width: 15,
                            height: 15,
                          ),
                  )
                : IconButton(
                    onPressed: null,
                    icon: widget.title == 'INC'
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
                Text(widget.title),
                Text('${widget.balance} ${widget.unit}'),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: widget.title == 'INC'
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
