import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

class BillBoxScreen extends StatelessWidget {
  final List<PaymentHistoryData> paymentList;

  const BillBoxScreen({
    Key? key,
    required this.paymentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('청구서가 없습니다.'),
    );
  }
}
