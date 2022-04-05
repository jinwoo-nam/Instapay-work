import 'package:flutter/material.dart';
import 'package:instapay_clone/domain/use_case/history_search/get_payment_history_use_case.dart';
import 'package:instapay_clone/presentation/history_search/history_search_state.dart';

class HistorySearchViewModel with ChangeNotifier {
  final GetPaymentHistoryUseCase getPaymentHistoryUseCase;

  HistorySearchState _state = HistorySearchState();

  HistorySearchState get state => _state;

  HistorySearchViewModel({
    required this.getPaymentHistoryUseCase,
  }) {
    fetchHistory();
  }

  void fetchHistory() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final historyList = await getPaymentHistoryUseCase.getPaymentHistoryList();
    historyList.when(success: (history) {
      _state = state.copyWith(
        paymentHistory: history,
        isLoading: false,
      );
    }, error: (message) {
      _state = state.copyWith(
        isLoading: false,
      );
    });

    notifyListeners();
  }

  void setMonthlyYearIndex(int index) {
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
}
