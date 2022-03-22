import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:instapay_clone/ui/color.dart';

class PaymentListWidget extends StatelessWidget {
  const PaymentListWidget({Key? key}) : super(key: key);

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
        children: [
          Text(
            "결제 내역",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("일시"),
                ),
                DataColumn(
                  label: Text("제목"),
                ),
                DataColumn(
                  label: Text("금액"),
                ),
              ],
              rows: List.generate(
                list.length,
                (index) => recentFileDataRow(list[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(PaymentHistory history) {
  return DataRow(
    cells: [
      DataCell(Text(history.date)),
      DataCell(Text(history.title)),
      DataCell(Text('${history.price}')),
    ],
  );
}

class PaymentHistory {
  final String date;
  final String title;
  final int price;

  PaymentHistory({
    required this.date,
    required this.title,
    required this.price,
  });
}

List<PaymentHistory> list = [
  PaymentHistory(date: '2022-01-12', title: '요범사훈', price: 7400),
  PaymentHistory(date: '2022-01-20', title: '죄와벌', price: 8000),
  PaymentHistory(date: '2022-02-02', title: '노트북', price: 7000),
  PaymentHistory(date: '2022-02-07', title: '화학 전공책', price: 25000),
  PaymentHistory(date: '2022-02-15', title: '성경', price: 10000),
];
