import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

abstract class GetPaymentHistoryRepository {
  Future<Result<List<PaymentHistoryData>>> getPaymentHistoryList();
}
