import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/history_search/payment_history_data.dart';
import 'package:instapay_clone/domain/repository/local/login_info_repository.dart';
import 'package:instapay_clone/domain/repository/tras/tras_repository.dart';

class GetTrasUseCase {
  final TrasRepository trasRepository;
  final LoginInfoRepository loginInfoRepository;

  GetTrasUseCase({
    required this.trasRepository,
    required this.loginInfoRepository,
  });

  Future<Result<List<PaymentHistoryData>>> call(
    String tid,
    int limit, {
    String yearMonth = '',
    String startDate = '',
    String endDate = '',
  }) async {
    String token = await loginInfoRepository.loadAccessToken();
    return await trasRepository.getTras(
      token,
      tid,
      limit,
      yearMonth: yearMonth,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
