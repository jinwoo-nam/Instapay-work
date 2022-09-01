import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

abstract class GetPaymentHistoryRepository {
  Future<Result<List<PaymentHistoryData>>> getPaymentRecentHistoryList(
      String tid, int limit);

  Future<Result<List<PaymentHistoryData>>> getPaymentMonthlyHistoryList(
      String yearMonth, String tid, int limit);

  Future<Result<List<PaymentHistoryData>>> getPeriodPaymentHistory(
      String startDate, String endDate, String tid, int limit);
}
