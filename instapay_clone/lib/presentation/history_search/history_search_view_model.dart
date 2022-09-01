import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/use_case/history_search/get_payment_history_use_case.dart';
import 'package:instapay_clone/presentation/history_search/history_search_state.dart';

class HistorySearchViewModel with ChangeNotifier {
  static const _pageSize = 10;

  final GetPaymentHistoryUseCase getPaymentHistoryUseCase;

  HistorySearchState _state = HistorySearchState();

  HistorySearchState get state => _state;

  late PagingController<int, PaymentHistoryData> _pagingController;

  set pagingController(PagingController<int, PaymentHistoryData> controller) {
    _pagingController = controller;
  }

  late PagingController<int, PaymentHistoryData> _monthPagingController;

  set mothPagingController(
      PagingController<int, PaymentHistoryData> controller) {
    _monthPagingController = controller;
  }

  late PagingController<int, PaymentHistoryData> _periodPagingController;

  set periodPagingController(
      PagingController<int, PaymentHistoryData> controller) {
    _periodPagingController = controller;
  }

  HistorySearchViewModel({
    required this.getPaymentHistoryUseCase,
  });

  void refreshRecentHistory() {
    _state = state.copyWith(
      curPageRecentPaymentHistory: [],
    );
    _pagingController.refresh();
    notifyListeners();
  }

  void fetchHistoryPage(int page) async {
    String tid = '';
    if (state.curPageRecentPaymentHistory.isNotEmpty) {
      tid = state.curPageRecentPaymentHistory.last.tid!;
    }

    print(page);
    final historyList = await getPaymentHistoryUseCase
        .getPaymentRecentHistoryList(tid, _pageSize);

    historyList.when(
      success: (history) async {
        final isLastPage = history.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(history);
        } else {
          final nextPageKey = page + 1;
          _pagingController.appendPage(history, nextPageKey);
        }
        _state = state.copyWith(
          curPageRecentPaymentHistory: history,
          isRecentDataEmpty: (page == 1) && history.isEmpty,
        );
      },
      error: (message) {},
    );
    notifyListeners();
  }

  void refreshMonthHistory() {
    _state = state.copyWith(
      curPageMonthPaymentHistory: [],
    );
    _monthPagingController.refresh();
    notifyListeners();
  }

  void refreshPeriodHistory() {
    _state = state.copyWith(
      curPagePeriodPaymentHistory: [],
    );
    _periodPagingController.refresh();
    notifyListeners();
  }

  void fetchMonthHistoryPage(int page, String yearMonth) async {
    String tid = '';
    if (state.curPageMonthPaymentHistory.isNotEmpty) {
      tid = state.curPageMonthPaymentHistory.last.tid!;
    }

    final historyList = await getPaymentHistoryUseCase
        .getPaymentMonthlyHistoryList(yearMonth, tid, _pageSize);
    historyList.when(
      success: (history) async {
        final isLastPage = history.length < _pageSize;
        if (isLastPage) {
          _monthPagingController.appendLastPage(history);
        } else {
          final nextPageKey = page + 1;
          _monthPagingController.appendPage(history, nextPageKey);
        }
        _state = state.copyWith(
          curPageMonthPaymentHistory: history,
          isRecentDataEmpty: (page == 1) && history.isEmpty,
        );
      },
      error: (message) {
        print(message);
      },
    );
    notifyListeners();
  }

  void fetchPeriodHistoryPage(int page) async {
    String tid = '';
    if (state.curPagePeriodPaymentHistory.isNotEmpty) {
      tid = state.curPagePeriodPaymentHistory.last.tid!;
    }
    String startDate = state.periodStartDate;
    String endDate = state.periodEndDate;

    if (startDate.isEmpty || endDate.isEmpty) {
      startDate = '00000000';
      endDate = '00000000';
    }

    final sDate =
        '${startDate.substring(0, 4)}-${startDate.substring(4, 6)}-${startDate.substring(6, 8)}';
    final eDate =
        '${endDate.substring(0, 4)}-${endDate.substring(4, 6)}-${endDate.substring(6, 8)}';
    final historyList = await getPaymentHistoryUseCase.getPeriodPaymentHistory(
        sDate, eDate, tid, _pageSize);

    historyList.when(
      success: (history) async {
        final isLastPage = history.length < _pageSize;
        if (isLastPage) {
          _periodPagingController.appendLastPage(history);
        } else {
          final nextPageKey = page + 1;
          _periodPagingController.appendPage(history, nextPageKey);
        }
        _state = state.copyWith(
          curPagePeriodPaymentHistory: history,
          isRecentDataEmpty: (page == 1) && history.isEmpty,
        );
      },
      error: (message) {
        print(message);
      },
    );
    notifyListeners();
  }

  void setMonthlyYearIndex(int index) async {
    _state = state.copyWith(
      monthlyScreenCurYearIndex: index,
    );
    notifyListeners();
  }

  void setMonthlyMonthIndex(int index) {
    _state = state.copyWith(
      monthlyScreenCurMonthIndex: index,
    );
    notifyListeners();
  }

  void setPeriodStartEndDate(String startDate, String endDate) {
    _state = state.copyWith(
      periodStartDate: startDate,
      periodEndDate: endDate,
    );
    notifyListeners();
  }
}
