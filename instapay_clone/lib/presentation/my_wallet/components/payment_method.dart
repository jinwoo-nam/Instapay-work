import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  String title;
  double balance;
  String unit;

  PaymentMethod({
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
        vertical: 8,
        horizontal: 25,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        minLeadingWidth: 0,
        tileColor: Colors.grey,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(widget.title), Text('${widget.balance}')],
        ),
        leading: Visibility(
          visible: viewModel.isSelectedDelete,
          child: IconButton(
            icon: const Icon(
              Icons.radio_button_off,
              size: 15,
            ),
            onPressed: () {},
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.star_border),
          onPressed: () {},
        ),
      ),
    );
  }
}
