import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/history_search/get_payment_history_data_source.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/repository/history_search/get_payment_history_repository.dart';

class GetPaymentHistoryRepositoryImpl implements GetPaymentHistoryRepository {
  final GetPaymentHistoryDataSource _dataSource;

  GetPaymentHistoryRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<PaymentHistoryData>>> getPaymentRecentHistoryList(
      String tid, int limit) async {
    return await _dataSource.getRecentPaymentHistory(tid, limit);
  }

  @override
  Future<Result<List<PaymentHistoryData>>> getPaymentMonthlyHistoryList(
      String yearMonth, String tid, int limit) async {
    return await _dataSource.getMonthPaymentHistory(yearMonth, tid, limit);
  }
}
