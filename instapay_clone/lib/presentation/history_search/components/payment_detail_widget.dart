import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/components/chart_widget.dart';
import 'package:instapay_clone/presentation/history_search/components/payment_info_card.dart';

import '../../../ui/color.dart';

class PaymentDetailWidget extends StatelessWidget {
  const PaymentDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "결제 상세",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          ChartWidget(),
          PaymentInfoCard(
            imgSrc: "imgs/wallet-bankaccount@2x.png",
            title: "신한은행",
            accountNumber: "110-1234-1234",
            price: 13500,
          ),
          PaymentInfoCard(
            imgSrc: "imgs/wallet-bankaccount@2x.png",
            title: "신한은행",
            accountNumber: "110-1234-1234",
            price: 20000,
          ),
          PaymentInfoCard(
            imgSrc: "imgs/wallet-bankaccount@2x.png",
            title: "국민은행",
            accountNumber: "5674-7897-45646",
            price: 13280,
          ),
          PaymentInfoCard(
            imgSrc: "imgs/wallet-bankaccount@2x.png",
            title: "Etherium",
            accountNumber: "110-1010-1010",
            price: 140,
          ),
        ],
      ),
    );
  }
}
