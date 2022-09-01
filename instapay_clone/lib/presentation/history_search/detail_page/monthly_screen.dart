import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_history_list_widget.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:instapay_clone/ui/color.dart' as color;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MonthlyScreen extends StatefulWidget {
  const MonthlyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MonthlyScreen> createState() => _MonthlyScreenState();
}

class _MonthlyScreenState extends State<MonthlyScreen> {
  final _monthPagingController =
      PagingController<int, PaymentHistoryData>(firstPageKey: 1);

  @override
  void initState() {
    Future.microtask(() {
      FocusScope.of(context).unfocus();
      final viewModel = context.read<HistorySearchViewModel>();
      DateTime now = DateTime.now();
      final year = now.year;

      _monthPagingController.addPageRequestListener((pageKey) {
        String yearMonth =
            '${year - viewModel.state.monthlyScreenCurYearIndex}-${NumberFormat('00').format(viewModel.state.monthlyScreenCurMonthIndex + 1)}';
        viewModel.fetchMonthHistoryPage(pageKey, yearMonth);
      });
      viewModel.mothPagingController = _monthPagingController;

      String yearMonth =
          '${year - viewModel.state.monthlyScreenCurYearIndex}-${NumberFormat('00').format(viewModel.state.monthlyScreenCurMonthIndex + 1)}';
      viewModel.refreshMonthHistory();
      viewModel.fetchMonthHistoryPage(1, yearMonth);
    });
    super.initState();
  }

  @override
  void dispose() {
    _monthPagingController.dispose();
    super.dispose();
  }

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
                          style: TextStyle(
                              color: (i == state.monthlyScreenCurYearIndex)
                                  ? color.mainSelectColor
                                  : Colors.black),
                        ),
                        onPressed: () {
                          viewModel.setMonthlyYearIndex(i);
                          viewModel.refreshMonthHistory();
                        },
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
                            style: TextStyle(
                                color: (state.monthlyScreenCurMonthIndex == i)
                                    ? color.mainSelectColor
                                    : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            viewModel.setMonthlyMonthIndex(i);
                            viewModel.refreshMonthHistory();
                          },
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
          flex: 9,
          child: PagedListView<int, PaymentHistoryData>(
            pagingController: _monthPagingController,
            builderDelegate: PagedChildBuilderDelegate<PaymentHistoryData>(
                itemBuilder: (context, history, index) {
              return PaymentHistoryListWidget(
                data: history,
              );
            }),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}
