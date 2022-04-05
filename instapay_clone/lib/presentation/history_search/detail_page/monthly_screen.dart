import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_history_list_widget.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:provider/provider.dart';

class MonthlyScreen extends StatelessWidget {
  final List<PaymentHistoryData> paymentList;

  const MonthlyScreen({
    Key? key,
    required this.paymentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistorySearchViewModel>();
    final state = viewModel.state;
    DateTime now = DateTime.now();
    final year = now.year;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 5; i++)
                      TextButton(
                        child: Text(
                          '${year - i}',
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          viewModel.setMonthlyYearIndex(i);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor:
                              (i == state.monthlyScreenCurYearIndex)
                                  ? color.mainSelectColor
                                  : Colors.transparent,
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < 12; i++)
                        TextButton(
                          child: Text(
                            '${i + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            viewModel.setMonthlyMonthIndex(i);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                (state.monthlyScreenCurMonthIndex == i)
                                    ? color.mainSelectColor
                                    : Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: (state.isLoading == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (paymentList.isEmpty)
                  ? RefreshIndicator(
                      onRefresh: () async {
                        viewModel.fetchHistory();
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 100.0),
                          child: Text('결제 내역이 없습니다.'),
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        viewModel.fetchHistory();
                      },
                      child: ListView(
                        children: [
                          ...paymentList
                              .where((element) =>
                                  element.adate.split('-')[0] ==
                                  '${year - state.monthlyScreenCurYearIndex}')
                              .where((element) =>
                                  int.parse(element.adate.split('-')[1]) ==
                                  state.monthlyScreenCurMonthIndex + 1)
                              .map((e) => PaymentHistoryListWidget(data: e))
                              .toList(),
                        ],
                      ),
                    ),
        ),
      ],
    );
  }
}
