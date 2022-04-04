import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/repository/history_search/get_payment_history_repository.dart';

class GetPaymentHistoryUseCase {
  GetPaymentHistoryRepository repository;

  GetPaymentHistoryUseCase(this.repository);

  Future<Result<List<PaymentHistoryData>>> getPaymentHistoryList() async {
    final paymentHistory = await repository.getPaymentHistoryList();

    return paymentHistory.when(success: (paymentList) {
      return Result.success(paymentList);
    }, error: (message) {
      return Result.error(message);
    });
  }
}