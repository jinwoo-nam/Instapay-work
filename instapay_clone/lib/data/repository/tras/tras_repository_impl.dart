import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/tras/tras_api.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/repository/tras/tras_repository.dart';

class TrasRepositoryImpl implements TrasRepository {
  final TrasApi _dataSource = TrasApi();

  @override
  Future<Result<List<PaymentHistoryData>>> getTras(
      String token, String tid, int limit,
      {String yearMonth = '',
      String startDate = '',
      String endDate = ''}) async {
    return await _dataSource.getTras(token, tid, limit,
        yearMonth: yearMonth, startDate: startDate, endDate: endDate);
  }
}
