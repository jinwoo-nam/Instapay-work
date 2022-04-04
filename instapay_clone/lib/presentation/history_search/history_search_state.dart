import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_search_state.freezed.dart';

part 'history_search_state.g.dart';

@freezed
class HistorySearchState with _$HistorySearchState {
  factory HistorySearchState({
    @Default([]) List<PaymentHistoryData> paymentHistory,
    @Default(0) int monthlyScreenCurYearIndex,
    @Default(0) int monthlyScreenCurMonthIndex,
  }) = _HistorySearchState;

  factory HistorySearchState.fromJson(Map<String, dynamic> json) =>
      _$HistorySearchStateFromJson(json);
}
