import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_state.dart';
import 'package:instapay_clone/presentation/my_wallet/my_wallet_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class PaymentMethodWidget extends StatelessWidget {
  final MeansData data;
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
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
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
                    icon: state.defaultMid == data.mid
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
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          Text(
            data.mname,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color.mainNavy,
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Text(
            '${data.balance.isEmpty ? data.mnum : data.balance}',
          ),
        ],
      ),
    );
  }

  Widget buildIcon(MyWalletState state) {
    if (state.isSelectedDelete == true && data.mname != 'INC') {
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
    } else if (data.mname == 'INC') {
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
