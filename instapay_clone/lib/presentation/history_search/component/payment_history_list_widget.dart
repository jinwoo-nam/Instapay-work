import 'package:flutter/material.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_detail_widget.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:intl/intl.dart';

class PaymentHistoryListWidget extends StatelessWidget {
  final PaymentHistoryData data;

  const PaymentHistoryListWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numFormat = NumberFormat('###,###,###,###');

    int price = int.parse(data.tsum);
    final date = data.adate.split('-');
    final year = date[0];
    final month = date[1];
    final day = date[2].split(' ')[0];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentDetailWidget(
              data: data,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.gname,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        data.mname,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      (data.mname == 'INC')
                          ? Text(
                              '${data.tsum} INC',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            )
                          : Text(
                              '${numFormat.format(price)} KRW',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                      Text(
                        ('$year.$month.$day'),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
