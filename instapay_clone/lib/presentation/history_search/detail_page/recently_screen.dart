import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_history_list_widget.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:provider/provider.dart';

class RecentlyScreen extends StatelessWidget {
  final List<PaymentHistoryData> paymentList;

  const RecentlyScreen({
    Key? key,
    required this.paymentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistorySearchViewModel>();
    final state = viewModel.state;

    return (state.isLoading == true)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (paymentList.isEmpty)
            ? RefreshIndicator(
                onRefresh: () async {
                  viewModel.fetchHistory();
                },
                child: const Center(
                  child: Text('결제 내역이 없습니다.'),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    viewModel.fetchHistory();
                  },
                  child: ListView(
                    children: [
                      ...paymentList
                          .map((paymentHistory) => PaymentHistoryListWidget(
                                data: paymentHistory,
                              ))
                          .toList(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ],
                  ),
                ),
              );
  }
}
