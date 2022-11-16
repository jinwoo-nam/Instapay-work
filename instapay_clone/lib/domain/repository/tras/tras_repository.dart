import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';

abstract class TrasRepository {
  Future<Result<List<PaymentHistoryData>>> getTras(
      String token, String tid, int limit,
      {String yearMonth,String startDate,String endDate});
}
