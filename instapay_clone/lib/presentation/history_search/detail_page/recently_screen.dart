import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_history_list_widget.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:provider/provider.dart';

class RecentlyScreen extends StatefulWidget {
  const RecentlyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentlyScreen> createState() => _RecentlyScreenState();
}

class _RecentlyScreenState extends State<RecentlyScreen> {
  final _pagingController =
      PagingController<int, PaymentHistoryData>(firstPageKey: 1);

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<HistorySearchViewModel>();
      _pagingController.addPageRequestListener((pageKey) {
        viewModel.fetchHistoryPage(pageKey);
      });
      viewModel.pagingController = _pagingController;

      viewModel.refreshRecentHistory();
      viewModel.fetchHistoryPage(1);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistorySearchViewModel>();
    final state = viewModel.state;

    return (state.isLoading == true)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Visibility(
                visible: state.isRecentDataEmpty,
                child: const Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Text(
                      '결제 내역이 없습니다.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      viewModel.refreshRecentHistory();
                    },
                    child: PagedListView<int, PaymentHistoryData>(
                      pagingController: _pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<PaymentHistoryData>(
                        itemBuilder: (context, history, index) =>
                            PaymentHistoryListWidget(
                          data: history,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 30,
                ),
              )
            ],
          );
  }
}
