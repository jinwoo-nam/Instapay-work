import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/repository/history_search/get_payment_history_repository.dart';

class GetPaymentHistoryUseCase {
  GetPaymentHistoryRepository repository;

  GetPaymentHistoryUseCase(this.repository);

  Future<Result<List<PaymentHistoryData>>> getPaymentRecentHistoryList(
      String tid, int limit) async {
    final paymentHistory =
        await repository.getPaymentRecentHistoryList(tid, limit);

    return paymentHistory.when(success: (paymentList) {
      return Result.success(paymentList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  Future<Result<List<PaymentHistoryData>>> getPaymentMonthlyHistoryList(
      String yearMonth, String tid, int limit) async {
    final paymentHistory =
        await repository.getPaymentMonthlyHistoryList(yearMonth, tid, limit);

    return paymentHistory.when(success: (paymentList) {
      return Result.success(paymentList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  Future<Result<List<PaymentHistoryData>>> getPeriodPaymentHistory(
      String startDate, String endDate, String tid, int limit) async {

    final paymentHistory = await repository.getPeriodPaymentHistory(
        startDate, endDate, tid, limit);

    return paymentHistory.when(success: (paymentList) {
      return Result.success(paymentList);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
