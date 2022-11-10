import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/kfc/kfc_api.dart';
import 'package:instapay_clone/domain/model/kfc/kfc_first_result.dart';
import 'package:instapay_clone/domain/repository/kfc/kfc_repository.dart';

class KfcRepositoryImpl implements KfcRepository {
  final KfcApi _dataSource = KfcApi();

  @override
  Future<Result<KfcFirstResult>> kfcFirst(String token) async {
    return await _dataSource.kfcFirst(token);
  }
}
