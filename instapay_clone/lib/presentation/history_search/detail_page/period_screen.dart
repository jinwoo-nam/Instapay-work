import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/presentation/history_search/component/payment_history_list_widget.dart';
import 'package:instapay_clone/presentation/history_search/history_search_view_model.dart';
import 'package:provider/provider.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  final _periodPagingController =
      PagingController<int, PaymentHistoryData>(firstPageKey: 1);

  final controller = ScrollController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<HistorySearchViewModel>();
      startDate.text = viewModel.state.periodStartDate;
      endDate.text = viewModel.state.periodEndDate;

      _periodPagingController.addPageRequestListener((pageKey) {
        viewModel.fetchPeriodHistoryPage(pageKey);
      });
      viewModel.periodPagingController = _periodPagingController;

      viewModel.refreshPeriodHistory();
      viewModel.fetchPeriodHistoryPage(1);
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    startDate.dispose();
    endDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HistorySearchViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 22,
      ),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '시작일',
                                  style: TextStyle(
                                    fontSize: 19,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: startDate,
                                    decoration: const InputDecoration(
                                      hintText: 'yyyymmdd',
                                    ),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return '시작일을 입력해주세요.';
                                      }
                                      if (val.length != 8) {
                                        return '형식이 잘못되었습니다.';
                                      }
                                      try {
                                        int.parse(val);
                                      } catch (e) {
                                        return '숫자만 입력해야 합니다.';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  '종료일',
                                  style: TextStyle(
                                    fontSize: 19,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: endDate,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return '종료일을 입력해주세요.';
                                      }
                                      if (val.length != 8) {
                                        return '형식이 잘못되었습니다.';
                                      }
                                      try {
                                        int.parse(val);
                                      } catch (e) {
                                        return '숫자만 입력해야 합니다.';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'yyyymmdd',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: SizedBox(
                        width: 80,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              final sDate = startDate.text;
                              final eDate = endDate.text;
                              viewModel.setPeriodStartEndDate(sDate, eDate);
                              viewModel.refreshPeriodHistory();
                            }
                          },
                          child: const Text('조회'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 1.5,
                thickness: 1.5,
              ),
            ),
            PagedListView<int, PaymentHistoryData>(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              pagingController: _periodPagingController,
              builderDelegate: PagedChildBuilderDelegate<PaymentHistoryData>(
                  itemBuilder: (itemBuilderContext, history, index) {
                return (state.isRecentDataEmpty)
                    ? const Text('결제 내역이 없습니다.')
                    : PaymentHistoryListWidget(
                        data: history,
                      );
              }),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
