import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:intl/intl.dart';

class PaymentDetailWidget extends StatelessWidget {
  final PaymentHistoryData data;

  const PaymentDetailWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numFormat = NumberFormat('###,###,###,###');
    int price = int.parse(data.tsum);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.mainNavy,
        title: const Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Date',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        data.adate,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        data.mname,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment Amount',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      (data.mname == 'INC')
                          ? Text(
                              '${data.tsum} INC',
                              style: const TextStyle(fontSize: 17),
                            )
                          : Text(
                              '${numFormat.format(price)} KRW',
                              style: const TextStyle(fontSize: 17),
                            ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Payment status',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        data.tstatus,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Merchant',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        data.sname,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          'Product Name',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data.gname,
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Number',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        data.renum,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    data.mesg,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '확인',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    primary: color.key,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
